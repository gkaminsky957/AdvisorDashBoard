**General Infrmation:**
- Application does not have dependecies on any third party libraris so running it very straightforward: just build it from XCode.
- Application consists of four screens:
  - Landing screen contains a list of all advisors that shows advisor name and all of the custodians that are managed by a specific advisor. Custodian names are comma separated. This screen has a "Filter" button in upper right corner on navigation bar for the purpose of sorting the advisor list.
  - Upon clicking on "Filter" button, the sort screen is modally presentd with two buttons "Cancel" and "Save/Clear". Clicking on "Cancel" button dismisses the screen. If there is no filter selected, "Save/Clear" button is hidden. The two sorting options are sorting by name and number of custodians advisor manages. If any of the options are selected then "Save" button appears to commit the sorting. Pressing the "Save" button dismisses the filter screen and goes back to landing screen and advisor list is sorted based sorting option selected. "Clear" button is shown when the list was initially sorted to allow user to clear to filters. Clicking "Clear" button dismisses filter screen and advisors list is displayed in the order specified in the JSON response.
  - Clicking on any advisor cards on landing screen will navigate to account summary screen that shows all accounts managed by a selected advisor. This includes the account name, account number, and custodian name the manages that account.
  - Clicking on the specific account card will navigate to holding screen that shows all holdings that selected account has. This includes tha holding name, unit number, and unit price.

**Assumption made:**
- Network API layer provides two APIs: one for fetching advisor list and another for fetching accounts that an advisor manages. The assumption here is that advisor `id` field in advisor API response will match the `repId` field in account API response.
