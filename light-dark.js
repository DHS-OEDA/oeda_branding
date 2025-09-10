// light-dark.js
// Script to toggle between light and dark mode plots in Quarto
// Updated to work with Quarto's actual theme mechanism

document.addEventListener('DOMContentLoaded', function() {
    console.log('Quarto plot toggle script loaded');
    
    // Function to detect current Quarto theme
    function getCurrentQuartoTheme() {
        // Primary method: Check body classes (this is what Quarto actually uses)
        const bodyClasses = document.body.className;
        
        // Check for the specific Quarto classes
        if (bodyClasses.includes('quarto-dark')) {
            return 'dark';
        }
        if (bodyClasses.includes('quarto-light')) {
            return 'light';
        }
        
        // Fallback methods
        const stored = localStorage.getItem('quarto-color-scheme-default') || 
                      localStorage.getItem('quarto-color-scheme') ||
                      localStorage.getItem('bs-theme');
        
        const isDarkNavbar = document.querySelector('.navbar[data-bs-theme="dark"]');
        const isLightNavbar = document.querySelector('.navbar[data-bs-theme="light"]');
        
        // For debugging - only log occasionally to avoid spam
        if (Math.random() < 0.1) { // Log 10% of the time
            console.log('Theme detection:', {
                bodyClasses: bodyClasses,
                stored: stored,
                isDarkNavbar: !!isDarkNavbar,
                isLightNavbar: !!isLightNavbar
            });
        }
        
        // Determine theme based on available indicators
        if (stored === 'dark') return 'dark';
        if (stored === 'light') return 'light';
        
        if (isDarkNavbar && !isLightNavbar) {
            return 'dark';
        }
        
        // Default to light
        return 'light';
    }
    
    // Function to update plot visibility
    function updatePlotVisibility() {
        const currentTheme = getCurrentQuartoTheme();
        const isDarkMode = currentTheme === 'dark';
        
        console.log('Updating plots for theme:', currentTheme, 'isDark:', isDarkMode);
        
        const lightPlots = document.querySelectorAll('.plot-light');
        const darkPlots = document.querySelectorAll('.plot-dark');
        
        console.log('Found plots - Light:', lightPlots.length, 'Dark:', darkPlots.length);
        
        lightPlots.forEach(function(plot) {
            plot.style.display = isDarkMode ? 'none' : 'block';
        });
        
        darkPlots.forEach(function(plot) {
            plot.style.display = isDarkMode ? 'block' : 'none';
        });
        
        console.log('Plot visibility updated - showing', isDarkMode ? 'dark' : 'light', 'plots');
    }
    
    // Hook into Quarto's theme toggle function
    function hookQuartoToggle() {
        if (window.quartoToggleColorScheme) {
            const originalToggle = window.quartoToggleColorScheme;
            window.quartoToggleColorScheme = function() {
                console.log('Quarto theme toggle called');
                originalToggle.apply(this, arguments);
                // Wait for Quarto to finish its theme change
                setTimeout(updatePlotVisibility, 100);
                setTimeout(updatePlotVisibility, 300); // Fallback with longer delay
            };
            console.log('Successfully hooked into quartoToggleColorScheme');
        } else {
            console.log('quartoToggleColorScheme not found, will try again...');
            setTimeout(hookQuartoToggle, 500);
        }
    }
    
    // Initial setup
    updatePlotVisibility();
    
    // Hook into Quarto's toggle function
    hookQuartoToggle();
    
    // Listen for localStorage changes (when theme is changed)
    window.addEventListener('storage', function(e) {
        if (e.key && (e.key.includes('quarto-color') || e.key.includes('bs-theme'))) {
            console.log('LocalStorage theme change detected:', e.key, e.newValue);
            setTimeout(updatePlotVisibility, 50);
        }
    });
    
    // Listen for clicks on the theme toggle button
    document.addEventListener('click', function(e) {
        if (e.target.closest('.quarto-color-scheme-toggle')) {
            console.log('Theme toggle button clicked');
            setTimeout(updatePlotVisibility, 150);
            setTimeout(updatePlotVisibility, 400);
        }
    });
    
    // Watch for changes to navbar theme attribute (backup method)
    const navbarObserver = new MutationObserver(function(mutations) {
        mutations.forEach(function(mutation) {
            if (mutation.type === 'attributes' && 
                mutation.attributeName === 'data-bs-theme' &&
                mutation.target.classList.contains('navbar')) {
                console.log('Navbar theme changed:', mutation.target.getAttribute('data-bs-theme'));
                setTimeout(updatePlotVisibility, 50);
            }
        });
    });
    
    const navbar = document.querySelector('.navbar');
    if (navbar) {
        navbarObserver.observe(navbar, {
            attributes: true,
            attributeFilter: ['data-bs-theme']
        });
    }
    
    // Watch for changes to body/html classes
    const classObserver = new MutationObserver(function(mutations) {
        mutations.forEach(function(mutation) {
            if (mutation.type === 'attributes' && 
                mutation.attributeName === 'class' &&
                (mutation.target === document.body || mutation.target === document.documentElement)) {
                console.log('Body/HTML class changed');
                setTimeout(updatePlotVisibility, 50);
            }
        });
    });
    
    classObserver.observe(document.body, { attributes: true, attributeFilter: ['class'] });
    classObserver.observe(document.documentElement, { attributes: true, attributeFilter: ['class'] });
    
    // Periodic check as ultimate fallback
    let lastTheme = getCurrentQuartoTheme();
    setInterval(function() {
        const currentTheme = getCurrentQuartoTheme();
        if (currentTheme !== lastTheme) {
            console.log('Periodic check detected theme change:', lastTheme, '->', currentTheme);
            lastTheme = currentTheme;
            updatePlotVisibility();
        }
    }, 500);
    
    console.log('All theme detection methods initialized');
});

// Global function for manual testing
window.debugQuartoTheme = function() {
    console.log('=== Quarto Theme Debug ===');
    console.log('localStorage quarto-color-scheme-default:', localStorage.getItem('quarto-color-scheme-default'));
    console.log('localStorage quarto-color-scheme:', localStorage.getItem('quarto-color-scheme'));
    console.log('localStorage bs-theme:', localStorage.getItem('bs-theme'));
    console.log('body classes:', document.body.className);
    console.log('html classes:', document.documentElement.className);
    console.log('navbar theme:', document.querySelector('.navbar')?.getAttribute('data-bs-theme'));
    console.log('quartoToggleColorScheme exists:', typeof window.quartoToggleColorScheme);
    console.log('Light plots:', document.querySelectorAll('.plot-light').length);
    console.log('Dark plots:', document.querySelectorAll('.plot-dark').length);
};