# Upgrade Guide

This document describes how to upgrade the Material Theme from previous versions to the latest version with enhanced UX and accessibility features.

## Overview

The latest version of the Material Theme includes significant improvements to user experience, accessibility, and color schemes. These changes enhance the visual design while maintaining all existing functionality.

## Changes Included

### Visual Enhancements
- **Enhanced Color Schemes**: New predominant blue color for light theme with excellent contrast ratios
- **Improved Dark Mode**: Much better contrast than previous versions for enhanced readability
- **Modern UI Elements**: Enhanced buttons, forms, and typography
- **Custom Scrollbar Styling**: Better visibility for scrollable content

### Accessibility Improvements
- **WCAG AA Compliance**: Improved contrast ratios for text and UI elements
- **Better Focus States**: Enhanced keyboard navigation with visible focus indicators
- **Semantic HTML**: Improved structure for better screen reader support

### Technical Improvements
- **CSS Variables**: Consistent color system using CSS variables for easier maintenance
- **Tailwind Utilities**: Updated styling with modern utility-first CSS approach
- **Template Updates**: Enhanced key templates with improved class usage

## Upgrade Steps

### 1. Backup Current Installation
Before upgrading, backup your current theme files and database:

```bash
# Backup theme directory
cp -r /path/to/ojs/plugins/themes/material /path/to/backup/material-theme-backup

# If using database, create a backup
# Follow your hosting provider's database backup procedure
```

### 2. Install New Version
Replace the existing theme files with the new version:

```bash
# Navigate to your OJS installation
cd /path/to/ojs

# Replace the theme files (assuming you're in the theme directory)
rsync -av /path/to/new/material-theme/ plugins/themes/material/
```

### 3. Clear Caches
Clear OJS caches to ensure the new theme is properly loaded:

```bash
# Navigate to your OJS installation
cd /path/to/ojs

# Clear template cache
rm -rf cache/t_cache/*
rm -rf cache/f_ojs__

# Or use the command line tool if available
php tools/rebuildCache.php
```

### 4. Update Dependencies
If using a build system, rebuild the CSS:

```bash
# Navigate to the theme directory
cd plugins/themes/material

# Install dependencies
npm install

# Rebuild CSS
npx tailwindcss -i ./styles/src/input.css -o ./styles/dist/output.css --minify
```

### 5. Test the Upgrade
1. Visit your journal website
2. Check that the theme loads correctly
3. Verify that both light and dark modes work properly
4. Test accessibility features (keyboard navigation, contrast)
5. Ensure all pages display correctly

## Configuration Changes

### Default Color Option
The default color option has been changed to blue for optimal user experience. You can change this in the Journal Settings interface if needed.

### Theme Options
All existing theme options remain available:
- Color schemes (blue, green, indigo, sky, orange)
- Font families (system, Comic Neue, Cardo, Cormorant, etc.)
- Display statistics options
- Navigation menu styles

## Breaking Changes

There are no breaking changes in this upgrade. All existing functionality is preserved, with only visual and accessibility improvements added.

## Rollback Procedure

If you need to rollback to the previous version:

1. Restore the backed up theme files to `/path/to/ojs/plugins/themes/material/`
2. Clear caches again:
   ```bash
   rm -rf cache/t_cache/*
   rm -rf cache/f_ojs__
   ```
3. Verify the previous version loads correctly

## Support

If you encounter issues during the upgrade process:

1. Check the OJS error logs
2. Verify file permissions are correct
3. Ensure all files were copied completely
4. Contact the theme maintainer if issues persist

## Known Issues

None known at this time.

## Additional Resources

- [PKP Documentation](https://docs.pkp.sfu.ca/)
- [Material Theme Repository](https://github.com/munir-abbasi/material-theme-modifed)
- [Accessibility Guidelines](https://www.w3.org/WAI/WCAG2AA-Conformance/)
