as yet unclassified
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        package: 'Cypress-Platform';
        package: 'Cypress-Definitions'
          with: [ spec requires: 'Cypress-Platform' ];
        package: 'Cypress-Structure'
          with: [ spec requires: 'Cypress-Definitions' ];
        package: 'Cypress-Mocks';
        package: 'Cypress-Tests'
          with: [ spec requires: #('Cypress-Mocks' 'Cypress-Structure') ];
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core'
          with: #('Cypress-Platform' 'Cypress-Definitions' 'Cypress-Structure');
        group: 'Tests' with: #('Cypress-Tests');
        group: 'CI' with: #('Core' 'Tests');
        yourself ].
  spec
    for: #(#'pharo5.x' #'pharo6.x')
    do: [ 
      spec
        package: 'Cypress-Platform'
          with: [ spec includes: 'Cypress-Pharo-Platform' ];
        package: 'Cypress-Pharo-Platform'
          with: [ spec requires: 'Cypress-Platform' ];
        yourself ].
  spec
    for: #(#'gs3.3.x' #'gs3.4.x')
    do: [ 
      spec
        package: 'Cypress-Platform'
          with: [ spec includes: 'Cypress-GemStone-Platform' ];
        package: 'Cypress-GemStone-Platform'
          with: [ spec requires: 'Cypress-Platform' ];
        yourself ]