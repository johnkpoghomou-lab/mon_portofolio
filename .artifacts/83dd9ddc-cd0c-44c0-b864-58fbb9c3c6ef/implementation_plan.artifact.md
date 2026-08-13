# Implementation Plan - Modern Tech & Glassmorphism UI Upgrade

Upgrade the portfolio's visual identity to a modern "Tech" look featuring Glassmorphism, animated backgrounds, and polished interactions.

## User Review Required

> [!IMPORTANT]
> This upgrade will change the global look and feel of your site.
> 1. **Floating Navbar**: The menu will now "float" at the top of the screen as you scroll.
> 2. **Animated Background**: I will add subtle blurred "blobs" in the background to add depth.
> 3. **Interactivity**: Cards will have a more pronounced "Glow" effect when hovered.

## Proposed Changes

### Global Layout & Background

#### [MODIFY] [home_screen.dart](file:///C:/Projets/mon_portofolio/lib/screens/home/home_screen.dart)
- Wrap the main `Scaffold` content in a `Stack`.
- Add a `BackgroundDecorations` widget behind the scrollable content.
- Move the `Navbar` inside the `Stack` and wrap it with `Positioned` to make it float.

#### [NEW] [background_blobs.dart](file:///C:/Projets/mon_portofolio/lib/core/widgets/background_blobs.dart)
- Create a widget that renders large, blurred, semi-transparent circles at various positions to create a "Mesh Gradient" effect.

### Floating Glass Navbar

#### [MODIFY] [navbar.dart](file:///C:/Projets/mon_portofolio/lib/core/widgets/navbar.dart)
- Update the `Container` to use `BackdropFilter` (blur) and a semi-transparent background.
- Add a thin border and rounded corners.
- Reduce height and width slightly to give it a "floating island" look.

### Section Upgrades

#### [MODIFY] [hero_section.dart](file:///C:/Projets/mon_portofolio/lib/sections/hero_section.dart)
- Use `ShaderMask` for the name "John Kpoghomou" to create a premium blue-to-cyan gradient.
- Refine the profile image shadow to be more "diffused".

#### [MODIFY] [skills_section.dart](file:///C:/Projets/mon_portofolio/lib/sections/skills_section.dart)
- Update `_SkillCard` to have a "Glass" look.
- Implement a border glow effect that matches the skill's color on hover.

#### [MODIFY] [projets_section.dart](file:///C:/Projets/mon_portofolio/lib/sections/projets_section.dart)
- Synchronize card styles with the new "Tech" aesthetic.

## Verification Plan

### Manual Verification
- **Web Layout**: Check that the Navbar remains readable and functional while floating.
- **Scrolling**: Verify that background blobs don't interfere with content readability.
- **Hover Effects**: Test that all card animations (Skills, Projects) are smooth and responsive.
- **Mobile View**: Ensure the "Floating" navbar doesn't take too much space on small screens.
