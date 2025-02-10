select p.party_id,per.first_name ,per.last_name,cm.INFO_STRING ,tn.CONTACT_NUMBER ,p.created_date
from party p
join party_role pr on pr.PARTY_ID =p.PARTY_ID 
join person per on per.party_id=p.PARTY_ID 
join party_contact_mech pcm on p.PARTY_ID =pcm.PARTY_ID 
join contact_mech cm on pcm.CONTACT_MECH_ID =cm.CONTACT_MECH_ID 
left join telecom_number tn on pcm.CONTACT_MECH_ID = tn.CONTACT_MECH_ID 
where pr.ROLE_TYPE_ID = 'Customer' and cm.CONTACT_MECH_TYPE_ID != 'POSTAL_ADDRESS' and p.CREATED_DATE between '2023-05-31' and '2023-07-01' ;

--EXPLANATION (APPROACH)
-- I have started the join with a party table as i need all the customers which signed in during june 2023 and i have the created date stored in party table . I have connected join with party role table as i want ony customers data . Then i have connected it with person table as i want the fields like person's first_name ,last name .Then to fetch the contact info connected it with party contact mech and fetch email from contact mech and contact number from telecom number table . Used left join with telecom number because i also want contact related to email address and then i also applied condition that cm.CONTACT_MECH_TYPE_ID != 'POSTAL_ADDRESS' because i want to eliminate the contact mech with POSTAL_ADDRESS.
