Class {
	#name : #BaselineOfGtStuff,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtStuff
}

{ #category : #loading }
BaselineOfGtStuff class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt-stuff' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGtStuff >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtStuff'
		]
]
