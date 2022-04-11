---
id: 6bt1ln4plvgrrvkvct8nplf
title: Subscriptions
desc: ''
updated: 1649657504436
created: 1649657357211
---

# Power of One Subscription Flow

## Free thoughts

On new subscription `_trialEndTime = DateTime.now().microsecondsSinceEpoch + 604800000` where 604,800,000 = 7 days in milliseconds.

Will need a function to check user trial time on application load.
User account will need a hasTrial flag stored in the database with user data.
`checkUserTrialStatus` will set the `hasTrial` boolean to false once the trial period is over, i.e. after 7 days from user account creation.
`checkUserTrialStatus` will check if `user.subscription.getTrialTimeLeft()` is less than `DataTime.now().microsecondsSinceEpoch`

## When user purchases a subscription
- `user.subscription.setSubscription()` will take a subscription package and assign it to the user's `_activeSubscription`.
- the users subscription `_isActive` flag will be set to true.
- `calculateSubscriptionEndTime()` will assign `_subscriptionEndTime` proper value based off of subscription package time. 



## Needs
- Subscription Model

## Good to haves
- User account creation time

## Questions
- What needs to go into PO1Subscription, PO1User,

### Notes
- 7 days in milliseconds = 604800000
- 30 days in milliseconds = 2592000000
- 182 days in milliseconds = 15724800000
- 365 days in milliseconds = 31536000000