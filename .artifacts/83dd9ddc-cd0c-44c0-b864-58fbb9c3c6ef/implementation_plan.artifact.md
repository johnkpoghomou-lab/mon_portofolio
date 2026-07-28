# Implementation Plan - Fix Mobile Overflow in Project Details

Resolve the layout overflow issue when viewing project details on mobile devices by making the dialog responsive and ensuring text wraps correctly.

## User Review Required

> [!IMPORTANT]
> The fix involves making the dialog adapt its size, padding, and font sizes based on the screen width. I will also ensure that long feature descriptions wrap to the next line instead of causing an overflow.

## Proposed Changes

### Portfolio Section

#### [MODIFY] [projets_section.dart](file:///C:/Projets/mon_portofolio/lib/sections/projets_section.dart)
- **Responsive Dialog**:
    - Add `insetPadding` to the `Dialog` to prevent it from touching screen edges on mobile.
    - Adjust the image height (e.g., 200 on mobile vs 300 on desktop).
    - Adjust the title font size and general padding based on screen width.
- **Fix Feature List Overflow**:
    - Wrap the feature text in an `Expanded` widget within the `Row` to ensure it wraps when it's too long.
- **General Improvements**:
    - Ensure the close button remains accessible and clearly visible.

## Verification Plan

### Manual Verification
- Run the Flutter web app.
- Use Chrome DevTools to simulate different mobile devices (iPhone SE, Pixel 7, etc.).
- Open the project details dialog.
- Verify that there are no "Yellow/Black" overflow warnings.
- Ensure the text is readable and the layout looks balanced on both mobile and desktop.
