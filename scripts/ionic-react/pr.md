1. Initialize a baseline project in the [${DIR}](.) subdirectory
   1. ${COMMAND_0}
   1. ${COMMAND_1}
   1. ${COMMIT_0}
1. Add Cypress component testing support with a sample test
   1. ${COMMAND_2}
   1. Update [package.json](package.json) eslint config to include `"plugin:cypress/recommended"`
   1. Add [cypress.json](cypress.json)
   1. Add [cypress/tsconfig.json](cypress/tsconfig.json)
   1. Add [cypress/plugins/index.ts](cypress/plugins/index.ts)
   1. Add [src/pages/Tab1.spec.ct.tsx](src/pages/Tab1.spec.ct.tsx)
   1. `npx cypress open-ct` (Notice that the fonts don't inherit global app styles)
   1. Rename `cypress/support/index.js` to `index.ts`, and `cypress/support/commands.js` to `commands.ts`
   1. Edit [cypress/support/index.ts](cypress/support/index.ts) to import Ionic styles, the Cypress test preview should update automatically
   1. ${COMMIT_1}   
   
Notes:

- Some older Create React App projects may need v4 of html-webpack-plugin, in which case you'd also need to do:
  - `yarn add -D html-webpack-plugin@4`
