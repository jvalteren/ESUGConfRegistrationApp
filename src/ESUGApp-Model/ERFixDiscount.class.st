Class {
	#name : #ERFixDiscount,
	#superclass : #ERDiscountStrategy,
	#instVars : [
		'amount',
		'currency'
	],
	#category : #'ESUGApp-Model'
}

{ #category : #accessing }
ERFixDiscount >> amount [
	^ amount
]

{ #category : #accessing }
ERFixDiscount >> amount: anObject [
	amount := anObject
]

{ #category : #accessing }
ERFixDiscount >> currency [
	^ currency
]

{ #category : #accessing }
ERFixDiscount >> currency: anObject [
	currency := anObject
]

{ #category : #accessing }
ERFixDiscount >> description [ 
	^ 'Discount of ', amount asString , ' ', currency
]

{ #category : #initialization }
ERFixDiscount >> initialize [
	super initialize.
]