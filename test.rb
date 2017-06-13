def lookup(h, k)
  key = k.split('.')
  key_part = key.shift
  val = h
  while key_part
    print "looking up #{key_part} in #{val}\n"
    val = val[key_part.to_sym]
    print "got val #{val}\n"
    key_part = key.shift
  end
  print "returning val #{val}\n"
  val
end

h = {
    "address": {
        "locality": "Green Industrial Park",
        "paon": "Unit 5",
        "postcode": "NT23 7TN",
        "saon": "Office 2a",
        "street": "Milton Street",
        "town": "New Town"
    },
    "attributes": {
        "businessRef": "0123456789",
        "contactName": "John Doe",
        "employeeCount": "50",
        "enterpriseName": "ABC Limited",
        "facsimile": "+44 1234 567890",
        "fulltimeCount": "35",
        "legalStatus": "Private Limited Company",
        "name": "Bolts and Ratchets Ltd",
        "sic2003": "2520",
        "sic2007": "2520",
        "telephone": "+44 1234 567890",
        "tradingName": "ABC Trading Ltd",
        "turnover": "350"
    },
    "id": "3b136c4b-7a14-4904-9e01-13364dd7b972",
    "reference": "49900001000",
    "sampleUnitType": "B"
}

print lookup(h, 'attributes.contactName')
