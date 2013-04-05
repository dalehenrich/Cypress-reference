"Load and run tests to be performed by TravisCI"
| gitPath |
Transcript cr; show: 'travis---->travisCI.st'.
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"Load the CypressReference Tests ... "
Metacello new
	baseline: 'CypressReference';
  repository: 'filetree://', gitPath, '/Cypress-reference/repository';
  load: 'Tests'.

"Run the CypressReference tests"
MetacelloPlatform current authorName: 'testMonkey'. "These tests save code ... need an Author"

TravisCIHarness
  value: #( 'BaselineOfCypressReference' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
