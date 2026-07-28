# Implementation Plan - Project Details Display

Enable users to view detailed information about a project when they click on a project card or the "Détails du projet" button in the portfolio section.

## User Review Required

> [!IMPORTANT]
> I will implement a modern dialog (popup) to show project details. Should the entire card be clickable, or just the "Détails du projet" button that appears on hover? I'll start by making both clickable for better UX.

## Proposed Changes

### Portfolio Section

#### [MODIFY] [projets_section.dart](file:///C:/Projets/mon_portofolio/lib/sections/projets_section.dart)
- Update the `projects` list to include more detailed information (e.g., `longDescription`, `features`).
- Implement a `_showProjectDetails` method to display a `showDialog` with project information.
- Wrap the project card in a `GestureDetector` or update the `ElevatedButton`'s `onPressed` to trigger the dialog.
- Design the dialog UI to be responsive and consistent with the site's theme.

## Verification Plan

### Manual Verification
- Run the Flutter web app.
- Navigate to the "Projets" section.
- Hover over a project to see the "Détails du projet" button.
- Click the button and verify the dialog opens with correct information.
- Click outside or on a close button to ensure the dialog closes.
- Test clicking on the card itself (if implemented).
