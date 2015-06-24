
-- Host: 127.0.0.1
-- Generation Time: May 06, 2015 at 07:56 PM
--
-- Database: `UNODBUSER`
--

-- --------------------------------------------------------


-- Table structure for table `userslist`

CREATE TABLE IF NOT EXISTS `userslist` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `nname` text NOT NULL,
  `phoneno` varchar(20) NOT NULL,
  `pwd` varchar(128) NOT NULL,
  `Salt` varchar(128) NOT NULL,
  `LoggedIn` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Table structure for table `gamerooms`
--

CREATE TABLE IF NOT EXISTS `gamerooms` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PrimaryPlayerId` int(11) NOT NULL,
  `SecondId` int(11) DEFAULT NULL,
  `ThirdId` int(11) DEFAULT NULL,
  `FourthId` int(11) DEFAULT NULL,
  `GameStatus` text NOT NULL,
  `GameMoves` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- -------------------------------------------------------

CREATE TABLE IF NOT EXISTS `winstats` (
  `Id` int(20) NOT NULL,
  `Wins` int(20) NOT NULL,
  `Loses` int(20) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

