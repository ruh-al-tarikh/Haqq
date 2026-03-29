## 2025-05-14 - Mobile Navigation Accessibility & UX
**Learning:** The initial implementation of the mobile hamburger menu was missing CSS and accessibility attributes (ARIA labels, roles). Using a <button> instead of a <div> for the hamburger menu is better for screen readers and keyboard navigation.
**Action:** Always ensure interactive elements use semantic HTML (like <button>) and have appropriate ARIA attributes.

## 2025-05-15 - Global Focus Indicators and Conflict Resolution
**Learning:** Legacy merge conflicts in core CSS and templates can completely break the intended UX layout. Implementing global `:focus-visible` styles ensures that all interactive elements are accessible without compromising the aesthetic for mouse users.
**Action:** Use `:focus-visible` to provide high-contrast focus indicators (`outline: 3px solid var(--gold)`) that match the brand's color palette.
