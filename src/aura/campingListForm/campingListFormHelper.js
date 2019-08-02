({

    createItem: function (component, item) {
        var updateEvent = component.getEvent("addItem");
        updateEvent.setParams({ "item": item });
        updateEvent.fire();
        component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c',
            'Name': '',
            'Price__c': 0.0,
            'Quantity__c': 0,
            'Packed__c': false });
    },
})