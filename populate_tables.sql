-- author = megan

--Add accounts
INSERT INTO account values('emininem ', 'musiciscool', 1234567890, 'musiciscool@mm.com', 'Em', 'iNem', 0);
INSERT INTO account values('admin', 'super', 3492788660, 'admin@super.com', 'ad', 'Min', 1);
INSERT INTO account values('harrypotter', 'expelliarmus', '8888888888', 'hjpotter@hogwarts.edu','Harry','Potter', 0);
INSERT INTO account values('hermioneG', 'wingardiumleviosa', '7777777777', 'hjgranger@hogwarts.edu','Hermione','Granger', 0);
INSERT INTO account values('RonW', 'oops', '333333333', 'rbweasley@hogwarts.edu', 'Ronald', 'Weasley', 0);
INSERT INTO account values('user1', 'password1', '0123456789', 'user2@csbsju.edu', 'user', 'two', 0);
INSERT INTO account values('user2', 'password2', '0123456789', 'user2@csbsju.edu', 'user', 'two', 0);
INSERT INTO account values('user3', 'password3', '0123456789', 'user3@csbsju.edu', 'user', 'three', 0);
INSERT INTO account values('user4', 'password4', '0123456789', 'user4@csbsju.edu', 'user', 'four', 0);

----Add customers
--INSERT INTO customer values('harrypotter', '8888888888', 'hjpotter@hogwarts.edu','Harry','Potter');
--INSERT INTO customer values('user1', '0123456789', 'user1@csbsju.edu', 'user', 'one');
--INSERT INTO customer values('hermioneG', '7777777777', 'hjgranger@hogwarts.edu','Hermione','Granger');
--INSERT INTO customer values('RonW', '333333333', 'rbweasley@hogwarts.edu', 'Ronald', 'Weasley');
--INSERT INTO customer values('user2', '0123456789', 'user2@csbsju.edu', 'user', 'two');
--INSERT INTO customer values('user3', '0123456789', 'user3@csbsju.edu', 'user', 'three');
--INSERT INTO customer values('user4', '0123456789', 'user4@csbsju.edu', 'user', 'four');

--Add auctions
INSERT INTO auction values('0', 'harrypotter', '01-SEP-2016', '01-SEP-2017', 
  30.00, 'Broomstick', 'Nimbus 2001 for sale!!!!', 'Vehicles');
INSERT INTO auction values('1', 'hermioneG', '02-NOV-2016', '03-DEC-2016',
  50.00, 'Fantastic Beasts and Where to Find Them', 'Newt Scamanders classic reference book!', 'Books');
INSERT INTO auction values('3', 'user1', '26-OCT-2016', '29-OCT-2016',
  20.00, 'How to Be Generic: a guide', 
  'Learn about how I fulfilled my dream of being the most generic person i could be!', 'Books');
  
--Add bids
INSERT INTO bid values('3', 'user2', '27-OCT-2016:1:00', 30.00);
INSERT INTO bid values('3', 'user3', '27-OCT-2016:2:00', 40.00);
INSERT INTO bid values('3', 'user2', '27-OCT-2016:3:00', 50.00);
INSERT INTO bid values('3', 'user3', '27-OCT-2016:4:00', 60.00);

--Add feedback
INSERT INTO feedback values('3','2','4','5','This is terrriblllee');  