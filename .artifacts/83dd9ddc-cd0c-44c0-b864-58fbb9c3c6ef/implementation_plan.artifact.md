# Implementation Plan - Portfolio Expansion & App Showcase

Upgrade the portfolio to reflect your growth as a professional app publisher and developer. This plan focuses on trust-building, service clarity, and prominently featuring your live applications.

## User Review Required

> [!IMPORTANT]
> This upgrade will introduce a new "Services" section and update your projects to show live Store links.
> 1. **Published Apps**: Do you have specific links for your apps (Play Store / App Store) that you'd like me to add now?
> 2. **Services**: I will propose 3 main services: Mobile Development, Web Solutions, and Digital Consulting. Does this align with your business goals?

## Proposed Changes

### Global Structure

#### [MODIFY] [home_screen.dart](file:///C:/Projets/mon_portofolio/lib/screens/home/home_screen.dart)
- Add a new `GlobalKey` for the `Services` section.
- Integrate the `ServicesSection` into the main `Column`.
- Update the navigation map to include "Services".

#### [MODIFY] [navbar.dart](file:///C:/Projets/mon_portofolio/lib/core/widgets/navbar.dart) & [mydrawer.dart](file:///C:/Projets/mon_portofolio/lib/core/widgets/mydrawer.dart)
- Add "Services" to the menu items.

### Content Upgrades

#### [MODIFY] [projets_section.dart](file:///C:/Projets/mon_portofolio/lib/sections/projets_section.dart)
- Update the `projects` data model to include `playStoreUrl` and `appStoreUrl`.
- Modify the `_showProjectDetails` dialog to include professional "Get it on Play Store/App Store" buttons.

#### [NEW] [services_section.dart](file:///C:/Projets/mon_portofolio/lib/sections/services_section.dart)
- Create a new section using a "Glassmorphism" grid to showcase your professional services.
- Include icons and descriptions for Mobile App Development, Web Development, and UI/UX Design.

#### [MODIFY] [about_section.dart](file:///C:/Projets/mon_portofolio/lib/sections/about_section.dart)
- Update the "Info Cards" to reflect your new status (e.g., "Developer Account Created", "Apps Published").

## Verification Plan

### Manual Verification
- **Navigation**: Verify that clicking "Services" in the Navbar scrolls correctly to the new section.
- **Project Dialogs**: Open a project dialog and verify that the Store buttons are visible and styled correctly.
- **Responsiveness**: Ensure the new Services grid looks good on both mobile and desktop.
- **Build**: Run `flutter build web` to ensure no regressions.
