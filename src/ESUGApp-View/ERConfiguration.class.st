Class {
	#name : #ERConfiguration,
	#superclass : #ERConfigurationTab,
	#category : #'ESUGApp-View-Tab'
}

{ #category : #rendering }
ERConfiguration >> backup [
	[ ERBackupRestore uniqueInstance backup.] 
		on: ERException 
		do: [ :exc | messageComponent changeToAlertOfError .
			messageComponent errorMessage: 'The backup could not be made' ]
]

{ #category : #initialization }
ERConfiguration >> initialize [
	super initialize.
	messageComponent := ERAlert warningAlert id: 'tabAlertOfconfiguration'.

]

{ #category : #rendering }
ERConfiguration >> renderBackupButtonOn: html [
	html horizontalRule .
	html heading level3; with: 'Back up' .
	html horizontalRule .
	html render: messageComponent .
	html heading level6 with: 'This feature allows you take a snapshot of page.'.
	html mdlAnchorButton
		raised;
		primaryColor;
		callback: [ self backup. self updateStateTab: self tabName ];
		with: 'Back up now'
]

{ #category : #rendering }
ERConfiguration >> renderContainerOn: html [
	self renderSwitchOpenCloseOn: html.
	self renderBackupButtonOn: html
]

{ #category : #rendering }
ERConfiguration >> renderSwitchOpenCloseOn: html [
	html form
		method: 'post';
		with: [
		self renderTitleForSwitchOn: html.
		html mdlSwitchContainer
			rippleEffect;
			style: 'width: 150px;';
			for: 'switchOpenClose';
			with: [ html mdlSwitch
				value: controller conference conferenceIsOpenRegistration;
				id: 'switchOpenClose';
				onTrue: [ controller openRegistration ] 
				onFalse: [ controller closeRegistration ];
				onChange: (html jQuery ajax serializeForm).
			html mdlSwitchLabel: 'Close / Open' ]
		]
]

{ #category : #rendering }
ERConfiguration >> renderTitleForSwitchOn: html [
	html horizontalRule .
	html heading level6 with: 'Change the state of the switch opens or closes the conference record'
]

{ #category : #accessing }
ERConfiguration >> tabId [
	^ 'tabConfiguration'
]

{ #category : #accessing }
ERConfiguration >> tabName [
	^ 'Configuration'
]

{ #category : #accessing }
ERConfiguration >> title [ 	
	^ 'Open / Close Registration'
]