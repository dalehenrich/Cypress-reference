baseline
baseline: spec
  <baseline>
  spec
    for: #(#'gs3.3.x' #'gs3.4.x')
    do: [ 
      spec
        package: 'Cypress-GemStoneCompatibilityLayer';
        package: 'Cypress-Definitions'
          with: [ spec requires: 'Cypress-GemStoneCompatibilityLayer' ];
        package: 'Cypress-Structure'
          with: [ spec requires: 'Cypress-Definitions' ];
        package: 'Cypress-GemStoneFileServer';
        package: 'Network-Url';
        package: 'Cypress-MesssageDigest';
        package: 'Cypress-PackageManagement'
          with: [ spec requires: 'Network-Url' ];
        package: 'Cypress-Comparison';
        package: 'Cypress-Mocks';
        package: 'Cypress-Tests'
          with: [ spec requires: #('Cypress-Mocks' 'Cypress-Structure') ];
        package: 'Cypress-PackageManagementTests'
          with: [ spec requires: #('Cypress-PackageManagement') ];
        package: 'NetworkTests' with: [ spec requires: #('Network-Url') ];
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core'
          with:
            #('Cypress-Structure' 'Cypress-GemStoneFileServer' 'Cypress-MesssageDigest' 'Cypress-PackageManagement' 'Cypress-Comparison');
        group: 'Tests'
          with:
            #('Cypress-Tests' 'Cypress-PackageManagementTests' 'NetworkTests');
        group: 'CI' with: #('Core' 'Tests');
        yourself ]