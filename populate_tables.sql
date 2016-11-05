--Add accounts
INSERT INTO account values('emininem ', 'musiciscool', 0, 0);
INSERT INTO account values('admin', 'super', 1, 0);
INSERT INTO account values('harrypotter', 'expelliarmus', 0, 0);
INSERT INTO account values('hermioneG', 'wingardiumleviosa', 0, 0);
INSERT INTO account values('RonW', 'oops', 0, 0);
INSERT INTO account values('user1', 'password1', 0, 0);
INSERT INTO account values('user2', 'password2', 0, 0);
INSERT INTO account values('user3', 'password3', 0, 0);
INSERT INTO account values('user4', 'password4', 0, 0);

--Add customers
INSERT INTO customer values('harrypotter', '8888888888', 'hjpotter@hogwarts.edu','Harry','Potter');
INSERT INTO customer values('user1', '0123456789', 'user1@csbsju.edu', 'user', 'one');
INSERT INTO customer values('hermioneG', '7777777777', 'hjgranger@hogwarts.edu','Hermione','Granger');
INSERT INTO customer values('RonW', '333333333', 'rbweasley@hogwarts.edu', 'Ronald', 'Weasley');

--Add auctions
INSERT INTO auction values('0', 'harrypotter', '01-SEP-2016', '01-SEP-2017', 
  30.00, 'Broomstick', 'Nimbus 2001 for sale!!!!', 'Vehicles');
INSERT INTO auction values('1', 'hermioneG', '02-NOV-2016', '03-DEC-2016',
  50.00, 'Fantastic Beasts and Where to Find Them', 'Newt Scamanders classic reference book!', 'Books');
INSERT INTO auction values('3', 'user1', '26-OCT-2016', '26-NOV-2016',
  20.00, 'How to Be Generic: a guide', 
  'Learn about how I fulfilled my dream of being the most generic person i could be!', 'Books');
  

