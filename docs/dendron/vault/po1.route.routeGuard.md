---
id: uj7c6mximloccnzwsgq06jj
title: routeGuard
desc: ''
updated: 1649829461283
created: 1649819308703
---

```dart
MaterialPage routeRedirect(){
    final loggedIn = _user.subscription.isLoggedIn();
    final navigatingToLoginPage = route.nextPage == LoginForm.id;

    if(!loggedIn && !navigatingToLoginPage) return LoginForm.id;
    if(loggedIn && navigatingToLoginPage) return Home.id;

    return null
}
```
