({
	packItem: function(component, event, helper) {
		component.set("v.item.Packed__c", true);
        let packedButton= event.getSource();
        packedButton.set("v.disabled", true);
	}
})