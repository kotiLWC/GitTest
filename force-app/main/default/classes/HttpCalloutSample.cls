public class HttpCalloutSample {
    public void getCalloutResponseContents() {
        String endpoint = 'https://api.androidhive.info/contacts/';
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        
        HttpResponse res = h.send(req);
        if(res.getStatusCode() == 200){
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            system.debug('============results==='+results);
            List<Object> contacts = (List<Object>) results.get('contacts');
            System.debug('Received the following contacts:');
            for (Object contact: contacts) {
                system.debug(contact);
            }

        }
        
    }
    
}