findstr /spim "TaskModuleDialogControl" \*.\*
where "TaskModuleDialogControl" is the name of the component/control your looking for
and \* is actional *

## Monolink Fresh Start

1.  In OfficeHome.ClientApp, do a yarn nuke
2.  In OfficeHome, do a git clean -fdx
3.  In OfficeHome.ClientApp, do a yarn
4.  In OfficeHome.ClientApp, run yarn monolink
5.  In OfficeHome.ClientApp, run yarn install
6.  In OfficeHomeNextGen, run volta pin yarn, then yarn
7.  In OfficeHome, run msbuild OfficeHomeNextGen.sln
8.  In OfficeHomeNextGen, run Start.bat

### To iterate in office-start:

1.  First time only, run watchers:  in OfficeHome.ClientApp, run yarn gulp:max webpack:watch:dev
2.  First time only:  in OfficeHomeNextGen, run yarn gulp link:app-bundles
3.  Make your office-start changes, rebuild with yarn build
4.  In OfficeHome.ClientApp, run yarn monolink sync
5.  See that the watchers pick up change
6.  In OfficeHomeNextGen, stop and re-run Start.bat