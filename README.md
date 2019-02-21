# Demo

- Demo application showing list of datas in tableview.

- Unit test case to test the `Network layer` using Quick Spec.

- Data is filtered to remove rows with nil values.

- Storyboard is avoided for the landingpage.

- Components are seperated as `View`, `CustomTableView`, `Model`, `ContentProvider` and `NetworkLayer`.

    - View & CustomTableView is composed as the view of the `ViewController` on load.
    - `ViewController` also confirms to tableview delegate mothods, and `pullTorefresh` callback.
    - Data is provided by the `ContenProvider`: it does the filtering and formating of the raw data model for the `View`.
    - `NetworkLayer` does the api request, to load the data.
    -  Callbacks are handled through blocks.
    - 3rd party frameworks `SDWebImage`, `SwiftLint`,  `Nimble`, `Quick` is used.
    - TravisCI is used for CI.
