CREATE TABLE `virtual_domains` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `virtual_users` (
  `id` int(11) NOT NULL auto_increment,
  `domain_id` int(11) NOT NULL,
  `password` varchar(106) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  FOREIGN KEY (domain_id) REFERENCES virtual_domains(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET= utf8mb4;

CREATE TABLE `virtual_aliases` (
  `id` int(11) NOT NULL auto_increment,
  `domain_id` int(11) NOT NULL,
  `source` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (domain_id) REFERENCES virtual_domains(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET= utf8mb4;



INSERT INTO `mailserver`.`virtual_domains` (`name`) VALUES ('bedroom.ephec-ti.eu'),('ephec-ti.eu'),('mail.bedroom.ephec-ti.eu'),('mail');

INSERT INTO `mailserver`.`virtual_users` (`domain_id`, `password` , `email`) VALUES ('1', 'user1234', 'root@bedroom.ephec-ti.eu'), ('1', 'user1234', 'contact@bedroom.ephec-ti.eu'), ('1', 'user1234', 'directeur@bedroom.ephec-ti.eu'), ('1', 'user1234', 'b2b@bedroom.ephec-ti.eu'), ('1', 'user1234', 'florent@bedroom.ephec-ti.eu');


INSERT INTO `mailserver`.`virtual_aliases` (`domain_id`, `source`, `destination`) VALUES ('1', 'florent@bedroom.ephec-ti.eu', 'florent@bedroom.ephec-ti.eu'),('1', 'igor@bedroom.ephec-ti.eu', 'igor@bedroom.ephec-ti.eu');
