as yet unclassified
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        package: 'Cypress-Definitions';
        package: 'Cypress-Structure'
          with: [ spec requires: 'Cypress-Definitions' ];
        package: 'Cypress-Mocks';
        package: 'Cypress-Tests' with: [ spec requires: 'Cypress-Mocks' ].
      spec
        group: 'default' with: #('Core');
        group: 'Core' with: #('Cypress-Definitions' 'Cypress-Structure');
        group: 'Tests' with: #('Cypress-Tests') ]