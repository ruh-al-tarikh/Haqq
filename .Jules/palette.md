## 2025-05-14 - Mobile Navigation Accessibility & UX
**Learning:** The initial implementation of the mobile hamburger menu was missing CSS and accessibility attributes (ARIA labels, roles). Using a <button> instead of a <div> for the hamburger menu is better for screen readers and keyboard navigation.
**Action:** Always ensure interactive elements use semantic HTML (like <button>) and have appropriate ARIA attributes.

## 2025-05-15 - Global Focus Indicators and Conflict Resolution
**Learning:** Legacy merge conflicts in core CSS and templates can completely break the intended UX layout. Implementing global `:focus-visible` styles ensures that all interactive elements are accessible without compromising the aesthetic for mouse users.
**Action:** Use `:focus-visible` to provide high-contrast focus indicators (`outline: 3px solid var(--gold)`) that match the brand's color palette.

## 2025-05-16 - Search 'No Results' UX & Accessibility
**Learning:** A search feature without a 'No Results' state can leave users confused when their query yields nothing. Providing a clear message and a 'Clear search' button improves accessibility and user flow.
**Action:** Always implement a dedicated empty state for search/filter interfaces that includes a way to reset the filter.
