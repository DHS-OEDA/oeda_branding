// Modified light-dark.js to toggle between image types in quarto
// Author: Aaron Cochran
// Adapted from Mickaël Canouil
// Version: <1.0.0>
// Description: Change image src depending on body class (quarto-light or quarto-dark)
// License: MIT
// light-dark.js
// Script to toggle between light and dark mode plots

document.addEventListener('DOMContentLoaded', function() {
    // Function to update plot sources based on theme
    function updatePlotSources() {
        const isDarkMode = document.documentElement.getAttribute('data-bs-theme') === 'dark';
        
        // Find all images that have both light and dark versions
        const plots = document.querySelectorAll('img[src*=".light.svg"], img[src*=".dark.svg"]');
        
        plots.forEach(function(img) {
            const src = img.getAttribute('src');
            const baseName = src.replace(/\.(light|dark)\.svg$/, '');
            
            if (isDarkMode) {
                // Switch to dark version
                img.setAttribute('src', baseName + '.dark.svg');
            } else {
                // Switch to light version  
                img.setAttribute('src', baseName + '.light.svg');
            }
        });
    }
    
    // Update plots on initial load
    updatePlotSources();
    
    // Watch for theme changes
    const observer = new MutationObserver(function(mutations) {
        mutations.forEach(function(mutation) {
            if (mutation.type === 'attributes' && 
                mutation.attributeName === 'data-bs-theme') {
                updatePlotSources();
            }
        });
    });
    
    // Start observing theme changes
    observer.observe(document.documentElement, {
        attributes: true,
        attributeFilter: ['data-bs-theme']
    });
    
    // Also listen for manual theme toggle events (if you have a theme switcher)
    document.addEventListener('themeChanged', updatePlotSources);
});