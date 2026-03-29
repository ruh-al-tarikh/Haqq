## 2026-03-29 - [Optimizing Critical Path and Resource Loading in Jekyll]
**Learning:** Moving inline scripts to the end of the body and adding resource hints for external domains (like YouTube) provides a measurable performance boost to the critical rendering path. Additionally, using Liquid's 'where_exp' and 'sort' for pre-filtering lists is more efficient than filtering inside a loop.
**Action:** Always check for blocking scripts in the head/header and implement preconnect/dns-prefetch for external resources. Use efficient Liquid filters for content generation.
