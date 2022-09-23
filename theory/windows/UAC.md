`User Account Control` - account with administrative priviliges always run `apps` and `tasks` in the security context of a `non-administrator account`, unless an administrator specifically authorizes administrator-level access to the system
(**doesn't apply to built-in `local administrator account`**)

right-click into application Properties -> Security tab - view users&groups with their permissions for that application

You can change/turn off `UAC` with appropriate tool (easy to find via `msconfig` -> tools)