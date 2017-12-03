/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para bacula
CREATE DATABASE IF NOT EXISTS `bacula` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bacula`;

-- Copiando estrutura para tabela bacula.BaseFiles
CREATE TABLE IF NOT EXISTS `BaseFiles` (
  `BaseId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `BaseJobId` int(10) unsigned NOT NULL,
  `JobId` int(10) unsigned NOT NULL,
  `FileId` bigint(20) unsigned NOT NULL,
  `FileIndex` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`BaseId`),
  KEY `basefiles_jobid_idx` (`JobId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.BaseFiles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `BaseFiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `BaseFiles` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.CDImages
CREATE TABLE IF NOT EXISTS `CDImages` (
  `MediaId` int(10) unsigned NOT NULL,
  `LastBurn` datetime DEFAULT NULL,
  PRIMARY KEY (`MediaId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.CDImages: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `CDImages` DISABLE KEYS */;
/*!40000 ALTER TABLE `CDImages` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.Client
CREATE TABLE IF NOT EXISTS `Client` (
  `ClientId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` tinyblob NOT NULL,
  `Uname` tinyblob NOT NULL,
  `AutoPrune` tinyint(4) DEFAULT '0',
  `FileRetention` bigint(20) unsigned DEFAULT '0',
  `JobRetention` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`ClientId`),
  UNIQUE KEY `Name` (`Name`(128))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.Client: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.Counters
CREATE TABLE IF NOT EXISTS `Counters` (
  `Counter` tinyblob NOT NULL,
  `MinValue` int(11) DEFAULT '0',
  `MaxValue` int(11) DEFAULT '0',
  `CurrentValue` int(11) DEFAULT '0',
  `WrapCounter` tinyblob NOT NULL,
  PRIMARY KEY (`Counter`(128))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.Counters: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Counters` DISABLE KEYS */;
/*!40000 ALTER TABLE `Counters` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.Device
CREATE TABLE IF NOT EXISTS `Device` (
  `DeviceId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` tinyblob NOT NULL,
  `MediaTypeId` int(10) unsigned DEFAULT '0',
  `StorageId` int(10) unsigned DEFAULT '0',
  `DevMounts` int(10) unsigned DEFAULT '0',
  `DevReadBytes` bigint(20) unsigned DEFAULT '0',
  `DevWriteBytes` bigint(20) unsigned DEFAULT '0',
  `DevReadBytesSinceCleaning` bigint(20) unsigned DEFAULT '0',
  `DevWriteBytesSinceCleaning` bigint(20) unsigned DEFAULT '0',
  `DevReadTime` bigint(20) unsigned DEFAULT '0',
  `DevWriteTime` bigint(20) unsigned DEFAULT '0',
  `DevReadTimeSinceCleaning` bigint(20) unsigned DEFAULT '0',
  `DevWriteTimeSinceCleaning` bigint(20) unsigned DEFAULT '0',
  `CleaningDate` datetime DEFAULT NULL,
  `CleaningPeriod` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`DeviceId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.Device: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Device` DISABLE KEYS */;
/*!40000 ALTER TABLE `Device` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.File
CREATE TABLE IF NOT EXISTS `File` (
  `FileId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `FileIndex` int(10) unsigned DEFAULT '0',
  `JobId` int(10) unsigned NOT NULL,
  `PathId` int(10) unsigned NOT NULL,
  `FilenameId` int(10) unsigned NOT NULL,
  `DeltaSeq` smallint(5) unsigned DEFAULT '0',
  `MarkId` int(10) unsigned DEFAULT '0',
  `LStat` tinyblob NOT NULL,
  `MD5` tinyblob,
  PRIMARY KEY (`FileId`),
  KEY `JobId` (`JobId`),
  KEY `JobId_2` (`JobId`,`PathId`,`FilenameId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.File: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `File` DISABLE KEYS */;
/*!40000 ALTER TABLE `File` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.Filename
CREATE TABLE IF NOT EXISTS `Filename` (
  `FilenameId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` blob NOT NULL,
  PRIMARY KEY (`FilenameId`),
  KEY `Name` (`Name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.Filename: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Filename` DISABLE KEYS */;
/*!40000 ALTER TABLE `Filename` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.FileSet
CREATE TABLE IF NOT EXISTS `FileSet` (
  `FileSetId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FileSet` tinyblob NOT NULL,
  `MD5` tinyblob,
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`FileSetId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.FileSet: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `FileSet` DISABLE KEYS */;
/*!40000 ALTER TABLE `FileSet` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.Job
CREATE TABLE IF NOT EXISTS `Job` (
  `JobId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Job` tinyblob NOT NULL,
  `Name` tinyblob NOT NULL,
  `Type` binary(1) NOT NULL,
  `Level` binary(1) NOT NULL,
  `ClientId` int(11) DEFAULT '0',
  `JobStatus` binary(1) NOT NULL,
  `SchedTime` datetime DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `RealEndTime` datetime DEFAULT NULL,
  `JobTDate` bigint(20) unsigned DEFAULT '0',
  `VolSessionId` int(10) unsigned DEFAULT '0',
  `VolSessionTime` int(10) unsigned DEFAULT '0',
  `JobFiles` int(10) unsigned DEFAULT '0',
  `JobBytes` bigint(20) unsigned DEFAULT '0',
  `ReadBytes` bigint(20) unsigned DEFAULT '0',
  `JobErrors` int(10) unsigned DEFAULT '0',
  `JobMissingFiles` int(10) unsigned DEFAULT '0',
  `PoolId` int(10) unsigned DEFAULT '0',
  `FileSetId` int(10) unsigned DEFAULT '0',
  `PriorJobId` int(10) unsigned DEFAULT '0',
  `PurgedFiles` tinyint(4) DEFAULT '0',
  `HasBase` tinyint(4) DEFAULT '0',
  `HasCache` tinyint(4) DEFAULT '0',
  `Reviewed` tinyint(4) DEFAULT '0',
  `Comment` blob,
  `FileTable` char(20) DEFAULT 'File',
  PRIMARY KEY (`JobId`),
  KEY `Name` (`Name`(128)),
  KEY `JobTDate` (`JobTDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.Job: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Job` DISABLE KEYS */;
/*!40000 ALTER TABLE `Job` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.JobHisto
CREATE TABLE IF NOT EXISTS `JobHisto` (
  `JobId` int(10) unsigned NOT NULL,
  `Job` tinyblob NOT NULL,
  `Name` tinyblob NOT NULL,
  `Type` binary(1) NOT NULL,
  `Level` binary(1) NOT NULL,
  `ClientId` int(11) DEFAULT '0',
  `JobStatus` binary(1) NOT NULL,
  `SchedTime` datetime DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `RealEndTime` datetime DEFAULT NULL,
  `JobTDate` bigint(20) unsigned DEFAULT '0',
  `VolSessionId` int(10) unsigned DEFAULT '0',
  `VolSessionTime` int(10) unsigned DEFAULT '0',
  `JobFiles` int(10) unsigned DEFAULT '0',
  `JobBytes` bigint(20) unsigned DEFAULT '0',
  `ReadBytes` bigint(20) unsigned DEFAULT '0',
  `JobErrors` int(10) unsigned DEFAULT '0',
  `JobMissingFiles` int(10) unsigned DEFAULT '0',
  `PoolId` int(10) unsigned DEFAULT '0',
  `FileSetId` int(10) unsigned DEFAULT '0',
  `PriorJobId` int(10) unsigned DEFAULT '0',
  `PurgedFiles` tinyint(4) DEFAULT '0',
  `HasBase` tinyint(4) DEFAULT '0',
  `HasCache` tinyint(4) DEFAULT '0',
  `Reviewed` tinyint(4) DEFAULT '0',
  `Comment` blob,
  `FileTable` char(20) DEFAULT 'File',
  KEY `JobId` (`JobId`),
  KEY `StartTime` (`StartTime`),
  KEY `JobTDate` (`JobTDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.JobHisto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `JobHisto` DISABLE KEYS */;
/*!40000 ALTER TABLE `JobHisto` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.JobMedia
CREATE TABLE IF NOT EXISTS `JobMedia` (
  `JobMediaId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `JobId` int(10) unsigned NOT NULL,
  `MediaId` int(10) unsigned NOT NULL,
  `FirstIndex` int(10) unsigned DEFAULT '0',
  `LastIndex` int(10) unsigned DEFAULT '0',
  `StartFile` int(10) unsigned DEFAULT '0',
  `EndFile` int(10) unsigned DEFAULT '0',
  `StartBlock` int(10) unsigned DEFAULT '0',
  `EndBlock` int(10) unsigned DEFAULT '0',
  `VolIndex` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`JobMediaId`),
  KEY `JobId` (`JobId`,`MediaId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.JobMedia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `JobMedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `JobMedia` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.Location
CREATE TABLE IF NOT EXISTS `Location` (
  `LocationId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Location` tinyblob NOT NULL,
  `Cost` int(11) DEFAULT '0',
  `Enabled` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.Location: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.LocationLog
CREATE TABLE IF NOT EXISTS `LocationLog` (
  `LocLogId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Date` datetime DEFAULT NULL,
  `Comment` blob NOT NULL,
  `MediaId` int(10) unsigned DEFAULT '0',
  `LocationId` int(10) unsigned DEFAULT '0',
  `NewVolStatus` enum('Full','Archive','Append','Recycle','Purged','Read-Only','Disabled','Error','Busy','Used','Cleaning') NOT NULL,
  `NewEnabled` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`LocLogId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.LocationLog: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `LocationLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `LocationLog` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.Log
CREATE TABLE IF NOT EXISTS `Log` (
  `LogId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `JobId` int(10) unsigned DEFAULT '0',
  `Time` datetime DEFAULT NULL,
  `LogText` blob NOT NULL,
  PRIMARY KEY (`LogId`),
  KEY `JobId` (`JobId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.Log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Log` DISABLE KEYS */;
/*!40000 ALTER TABLE `Log` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.Media
CREATE TABLE IF NOT EXISTS `Media` (
  `MediaId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `VolumeName` tinyblob NOT NULL,
  `Slot` int(11) DEFAULT '0',
  `PoolId` int(10) unsigned DEFAULT '0',
  `MediaType` tinyblob NOT NULL,
  `MediaTypeId` int(10) unsigned DEFAULT '0',
  `LabelType` tinyint(4) DEFAULT '0',
  `FirstWritten` datetime DEFAULT NULL,
  `LastWritten` datetime DEFAULT NULL,
  `LabelDate` datetime DEFAULT NULL,
  `VolJobs` int(10) unsigned DEFAULT '0',
  `VolFiles` int(10) unsigned DEFAULT '0',
  `VolBlocks` int(10) unsigned DEFAULT '0',
  `VolParts` int(10) unsigned DEFAULT '0',
  `VolCloudParts` int(10) unsigned DEFAULT '0',
  `VolMounts` int(10) unsigned DEFAULT '0',
  `VolBytes` bigint(20) unsigned DEFAULT '0',
  `VolABytes` bigint(20) unsigned DEFAULT '0',
  `VolAPadding` bigint(20) unsigned DEFAULT '0',
  `VolHoleBytes` bigint(20) unsigned DEFAULT '0',
  `VolHoles` int(10) unsigned DEFAULT '0',
  `LastPartBytes` bigint(20) unsigned DEFAULT '0',
  `VolType` int(10) unsigned DEFAULT '0',
  `VolErrors` int(10) unsigned DEFAULT '0',
  `VolWrites` bigint(20) unsigned DEFAULT '0',
  `VolCapacityBytes` bigint(20) unsigned DEFAULT '0',
  `VolStatus` enum('Full','Archive','Append','Recycle','Purged','Read-Only','Disabled','Error','Busy','Used','Cleaning') NOT NULL,
  `Enabled` tinyint(4) DEFAULT '1',
  `Recycle` tinyint(4) DEFAULT '0',
  `ActionOnPurge` tinyint(4) DEFAULT '0',
  `CacheRetention` bigint(20) unsigned DEFAULT '0',
  `VolRetention` bigint(20) unsigned DEFAULT '0',
  `VolUseDuration` bigint(20) unsigned DEFAULT '0',
  `MaxVolJobs` int(10) unsigned DEFAULT '0',
  `MaxVolFiles` int(10) unsigned DEFAULT '0',
  `MaxVolBytes` bigint(20) unsigned DEFAULT '0',
  `InChanger` tinyint(4) DEFAULT '0',
  `StorageId` int(10) unsigned DEFAULT '0',
  `DeviceId` int(10) unsigned DEFAULT '0',
  `MediaAddressing` tinyint(4) DEFAULT '0',
  `VolReadTime` bigint(20) unsigned DEFAULT '0',
  `VolWriteTime` bigint(20) unsigned DEFAULT '0',
  `EndFile` int(10) unsigned DEFAULT '0',
  `EndBlock` int(10) unsigned DEFAULT '0',
  `LocationId` int(10) unsigned DEFAULT '0',
  `RecycleCount` int(10) unsigned DEFAULT '0',
  `InitialWrite` datetime DEFAULT NULL,
  `ScratchPoolId` int(10) unsigned DEFAULT '0',
  `RecyclePoolId` int(10) unsigned DEFAULT '0',
  `Comment` blob,
  PRIMARY KEY (`MediaId`),
  UNIQUE KEY `VolumeName` (`VolumeName`(128)),
  KEY `PoolId` (`PoolId`),
  KEY `StorageId` (`StorageId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.Media: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Media` DISABLE KEYS */;
/*!40000 ALTER TABLE `Media` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.MediaType
CREATE TABLE IF NOT EXISTS `MediaType` (
  `MediaTypeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MediaType` tinyblob NOT NULL,
  `ReadOnly` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`MediaTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.MediaType: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `MediaType` DISABLE KEYS */;
/*!40000 ALTER TABLE `MediaType` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.Path
CREATE TABLE IF NOT EXISTS `Path` (
  `PathId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Path` blob NOT NULL,
  PRIMARY KEY (`PathId`),
  KEY `Path` (`Path`(255))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.Path: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Path` DISABLE KEYS */;
/*!40000 ALTER TABLE `Path` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.PathHierarchy
CREATE TABLE IF NOT EXISTS `PathHierarchy` (
  `PathId` int(11) NOT NULL,
  `PPathId` int(11) NOT NULL,
  PRIMARY KEY (`PathId`),
  KEY `pathhierarchy_ppathid` (`PPathId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.PathHierarchy: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `PathHierarchy` DISABLE KEYS */;
/*!40000 ALTER TABLE `PathHierarchy` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.PathVisibility
CREATE TABLE IF NOT EXISTS `PathVisibility` (
  `PathId` int(11) NOT NULL,
  `JobId` int(10) unsigned NOT NULL,
  `Size` bigint(20) DEFAULT '0',
  `Files` int(11) DEFAULT '0',
  PRIMARY KEY (`JobId`,`PathId`),
  KEY `pathvisibility_jobid` (`JobId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.PathVisibility: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `PathVisibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `PathVisibility` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.Pool
CREATE TABLE IF NOT EXISTS `Pool` (
  `PoolId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` tinyblob NOT NULL,
  `NumVols` int(10) unsigned DEFAULT '0',
  `MaxVols` int(10) unsigned DEFAULT '0',
  `UseOnce` tinyint(4) DEFAULT '0',
  `UseCatalog` tinyint(4) DEFAULT '0',
  `AcceptAnyVolume` tinyint(4) DEFAULT '0',
  `CacheRetention` bigint(20) unsigned DEFAULT '0',
  `VolRetention` bigint(20) unsigned DEFAULT '0',
  `VolUseDuration` bigint(20) unsigned DEFAULT '0',
  `MaxVolJobs` int(10) unsigned DEFAULT '0',
  `MaxVolFiles` int(10) unsigned DEFAULT '0',
  `MaxVolBytes` bigint(20) unsigned DEFAULT '0',
  `AutoPrune` tinyint(4) DEFAULT '0',
  `Recycle` tinyint(4) DEFAULT '0',
  `ActionOnPurge` tinyint(4) DEFAULT '0',
  `PoolType` enum('Backup','Copy','Cloned','Archive','Migration','Scratch') NOT NULL,
  `LabelType` tinyint(4) DEFAULT '0',
  `LabelFormat` tinyblob,
  `Enabled` tinyint(4) DEFAULT '1',
  `ScratchPoolId` int(10) unsigned DEFAULT '0',
  `RecyclePoolId` int(10) unsigned DEFAULT '0',
  `NextPoolId` int(10) unsigned DEFAULT '0',
  `MigrationHighBytes` bigint(20) unsigned DEFAULT '0',
  `MigrationLowBytes` bigint(20) unsigned DEFAULT '0',
  `MigrationTime` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`PoolId`),
  UNIQUE KEY `Name` (`Name`(128))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.Pool: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pool` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.RestoreObject
CREATE TABLE IF NOT EXISTS `RestoreObject` (
  `RestoreObjectId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ObjectName` blob NOT NULL,
  `RestoreObject` longblob NOT NULL,
  `PluginName` tinyblob NOT NULL,
  `ObjectLength` int(11) DEFAULT '0',
  `ObjectFullLength` int(11) DEFAULT '0',
  `ObjectIndex` int(11) DEFAULT '0',
  `ObjectType` int(11) DEFAULT '0',
  `FileIndex` int(10) unsigned DEFAULT '0',
  `JobId` int(10) unsigned NOT NULL,
  `ObjectCompression` int(11) DEFAULT '0',
  PRIMARY KEY (`RestoreObjectId`),
  KEY `JobId` (`JobId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.RestoreObject: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `RestoreObject` DISABLE KEYS */;
/*!40000 ALTER TABLE `RestoreObject` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.Snapshot
CREATE TABLE IF NOT EXISTS `Snapshot` (
  `SnapshotId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` tinyblob NOT NULL,
  `JobId` int(10) unsigned DEFAULT '0',
  `FileSetId` int(10) unsigned DEFAULT '0',
  `CreateTDate` bigint(20) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `ClientId` int(10) unsigned DEFAULT '0',
  `Volume` tinyblob NOT NULL,
  `Device` tinyblob NOT NULL,
  `Type` tinyblob NOT NULL,
  `Retention` int(11) DEFAULT '0',
  `Comment` blob,
  PRIMARY KEY (`SnapshotId`),
  UNIQUE KEY `snapshot_idx` (`Device`(255),`Volume`(255),`Name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.Snapshot: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Snapshot` DISABLE KEYS */;
/*!40000 ALTER TABLE `Snapshot` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.Status
CREATE TABLE IF NOT EXISTS `Status` (
  `JobStatus` char(1) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `JobStatusLong` blob,
  `Severity` int(11) DEFAULT NULL,
  PRIMARY KEY (`JobStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.Status: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `Status` DISABLE KEYS */;
REPLACE INTO `Status` (`JobStatus`, `JobStatusLong`, `Severity`) VALUES
	('A', _binary 0x43616E63656C65642062792075736572, 90),
	('B', _binary 0x426C6F636B6564, 15),
	('C', _binary 0x437265617465642C206E6F74207965742072756E6E696E67, 15),
	('D', _binary 0x56657269667920666F756E6420646966666572656E636573, 15),
	('E', _binary 0x5465726D696E617465642077697468206572726F7273, 25),
	('F', _binary 0x57616974696E6720666F7220436C69656E74, 15),
	('I', _binary 0x496E636F6D706C657465204A6F62, 25),
	('M', _binary 0x57616974696E6720666F72206D65646961206D6F756E74, 15),
	('R', _binary 0x52756E6E696E67, 15),
	('S', _binary 0x57616974696E6720666F722053746F72616765206461656D6F6E, 15),
	('T', _binary 0x436F6D706C65746564207375636365737366756C6C79, 10),
	('a', _binary 0x534420646573706F6F6C696E672061747472696275746573, 15),
	('c', _binary 0x57616974696E6720666F7220636C69656E74207265736F75726365, 15),
	('d', _binary 0x57616974696E67206F6E206D6178696D756D206A6F6273, 15),
	('e', _binary 0x4E6F6E2D666174616C206572726F72, 20),
	('f', _binary 0x466174616C206572726F72, 100),
	('i', _binary 0x446F696E6720626174636820696E736572742066696C65207265636F726473, 15),
	('j', _binary 0x57616974696E6720666F72206A6F62207265736F75726365, 15),
	('m', _binary 0x57616974696E6720666F72206E6577206D65646961, 15),
	('p', _binary 0x57616974696E67206F6E20686967686572207072696F72697479206A6F6273, 15),
	('s', _binary 0x57616974696E6720666F722073746F72616765207265736F75726365, 15),
	('t', _binary 0x57616974696E67206F6E2073746172742074696D65, 15);
/*!40000 ALTER TABLE `Status` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.Storage
CREATE TABLE IF NOT EXISTS `Storage` (
  `StorageId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` tinyblob NOT NULL,
  `AutoChanger` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`StorageId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.Storage: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `Storage` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.UnsavedFiles
CREATE TABLE IF NOT EXISTS `UnsavedFiles` (
  `UnsavedId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `JobId` int(10) unsigned NOT NULL,
  `PathId` int(10) unsigned NOT NULL,
  `FilenameId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`UnsavedId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.UnsavedFiles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `UnsavedFiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `UnsavedFiles` ENABLE KEYS */;

-- Copiando estrutura para tabela bacula.Version
CREATE TABLE IF NOT EXISTS `Version` (
  `VersionId` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bacula.Version: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `Version` DISABLE KEYS */;
REPLACE INTO `Version` (`VersionId`) VALUES
	(16);
/*!40000 ALTER TABLE `Version` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- CJJ - Criando as tabelas para o Webacula

CREATE TABLE IF NOT EXISTS webacula_logbook (
    logId           int(10) unsigned NOT NULL AUTO_INCREMENT,
    logDateCreate   datetime NOT NULL,
    logDateLast     datetime DEFAULT NULL,
    logTxt          text NOT NULL,
    logTypeId       int(10) unsigned NOT NULL,
    logIsDel        int(11) DEFAULT NULL,
    PRIMARY KEY (logId),
    KEY idx_logDateCreate (logDateCreate),
    KEY idx_logTxt (logTxt(127))
);


DROP TABLE IF EXISTS webacula_logtype;
CREATE TABLE IF NOT EXISTS webacula_logtype (
    typeId          int(10) unsigned NOT NULL,
    typeDesc        tinyblob NOT NULL,
    PRIMARY KEY (typeId)
);


INSERT INTO webacula_logtype (typeId,typeDesc) VALUES
       (10, 'Info'),
       (20, 'OK'),
       (30, 'Warning'),
       (255, 'Error')
;


/* Job descriptions */
CREATE TABLE IF NOT EXISTS webacula_jobdesc (
    desc_id         int(10) unsigned NOT NULL AUTO_INCREMENT,
    name_job        char(64) NOT NULL,
    retention_period char(32) DEFAULT NULL,
    short_desc      varchar(128) NOT NULL,
    description     text NOT NULL,
    PRIMARY KEY (desc_id),
    UNIQUE KEY name_job (name_job),
    KEY idx_short_desc (short_desc)
);


CREATE TABLE IF NOT EXISTS webacula_tmp_tablelist (
    tmpId           int(10) unsigned NOT NULL AUTO_INCREMENT,
    tmpName         char(64) NOT NULL,
    tmpJobIdHash    char(64) NOT NULL,
    tmpCreate       timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tmpIsCloneOk    int(11) DEFAULT '0',
    PRIMARY KEY (tmpId),
    UNIQUE KEY idx_tmpName (tmpName)
);


DROP TABLE IF EXISTS webacula_version;
CREATE TABLE IF NOT EXISTS webacula_version (
    versionId       int(10) unsigned NOT NULL
);


INSERT INTO webacula_version (versionId) VALUES (16);

CREATE TABLE IF NOT EXISTS webacula_users (
    id              int(11) NOT NULL AUTO_INCREMENT,
    login           varchar(50) NOT NULL,
    pwd             varchar(256) NOT NULL,
    name            varchar(150) DEFAULT NULL,
    email           varchar(50) DEFAULT NULL,
    create_login    datetime NOT NULL,
    last_login      datetime DEFAULT NULL,
    last_ip         varchar(40) DEFAULT NULL,
    active          int(11) DEFAULT NULL,
    role_id         int(11) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY idx_login (login)
);


CREATE TABLE IF NOT EXISTS webacula_roles (
    id              int(11) NOT NULL AUTO_INCREMENT,
    order_role      int(11) NOT NULL DEFAULT '1',
    name            varchar(50) NOT NULL,
    description     text,
    inherit_id      int(11) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY idx_name (name)
);


CREATE TABLE IF NOT EXISTS webacula_resources (
    id              int(11) NOT NULL AUTO_INCREMENT,
    dt_id           int(11) DEFAULT NULL,
    role_id         int(11) DEFAULT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS webacula_dt_resources (
    id              int(11) NOT NULL AUTO_INCREMENT,
    name            varchar(50) NOT NULL,
    description     text NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY idx_name (name)
);


INSERT INTO webacula_roles (id, name, description) VALUES (1, 'root_role', 'Default built-in superuser role');
INSERT INTO webacula_users (id, login, pwd, name, active, create_login, role_id)
    VALUES (1000, 'root', '$root_pwd', 'root', 1, NOW(), 1);


INSERT INTO webacula_roles (id, name, description) VALUES (2, 'operator_role', 'Typical built-in role for backup operator');


INSERT INTO webacula_resources (dt_id, role_id) VALUES
    (10,2),
    (20,2),
    (30,2),
    (40,2),
    (50,2),
    (60,2),
    (70,2),
    (80,2),
    (90,2),
    (100,2),
    (105,2),
    (110,2),
    (120,2),
    (130,2),
    (140,2),
    (150,2),
    (160,2),
    (500,2);


-- Controller names only
INSERT INTO webacula_dt_resources (id, name, description) VALUES
    (10, 'index',     'Home page'),
    (20, 'bconsole',  'Webacula bconsole'),
    (30, 'client',    'Menu Client'),
    (40, 'director',  'Menu Director'),
    (50, 'file',      'List Files for JobId'),
    (60, 'job',       'Menu Job'),
    (70, 'log',       'View console log for Job'),
    (80, 'pool',      'Menu Pool'),
    (90, 'restorejob','Menu Restore Job'),
    (100,'storage',   'Menu Storage'),
    (105,'schedule',  'Menu Schedule'),
    (110,'volume',    'Menu Volume'),
    (120,'wbjobdesc', 'Menu Job Descriptions'),
    (130,'wblogbook', 'Menu Logbook'),
    (140,'help',      'Menu Help'),
    (150,'feed',      'RSS feed'),
    (160,'chart',     'Timeline chart'),
    (500,'admin',     'Menu Administrator');


-- Bacula ACLs
CREATE TABLE IF NOT EXISTS webacula_client_acl (
    id              int(11) NOT NULL AUTO_INCREMENT,
    name            varchar(127) DEFAULT NULL,
    order_acl       int(11) DEFAULT NULL,
    role_id         int(11) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY idx_name (name,role_id),
    KEY idx_id (id,order_acl)
);


CREATE TABLE IF NOT EXISTS webacula_command_acl (
    id              int(11) NOT NULL AUTO_INCREMENT,
    dt_id           int(11) DEFAULT NULL,
    role_id         int(11) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY idx_dt_id (dt_id,role_id)
);


CREATE TABLE IF NOT EXISTS webacula_dt_commands (
    id              int(11) NOT NULL AUTO_INCREMENT,
    name            varchar(127) NOT NULL,
    description     text NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY idx_name (name)
);


-- see src/dird/ua_cmds.c
INSERT INTO webacula_dt_commands (id, name, description) VALUES
    (1,   '*all*',       'All commands'),
    (10,  'add',         'Add media to a pool'),
    (20,  'autodisplay', 'Autodisplay console messages'),
    (30,  'automount',   'Automount after label'),
    (40,  'cancel',      'Cancel a job'),
    (50,  'create',      'Create DB Pool from resource'),
    (60,  'delete',      'Delete volume, pool or job'),
    (70,  'disable',     'Disable a job'),
    (80,  'enable',      'Enable a job'),
    (90,  'estimate',    'Performs FileSet estimate, listing gives full listing'),
    (100, 'exit',        'Terminate Bconsole session'),
    (110, 'gui',         'Non-interactive gui mode'),
    (120, 'help',        'Print help on specific command'),
    (130, 'label',       'Label a tape'),
    (140, 'list',        'List objects from catalog'),
    (150, 'llist',       'Full or long list like list command'),
    (160, 'messages',    'Display pending messages'),
    (170, 'memory',      'Print current memory usage'),
    (180, 'mount',       'Mount storage'),
    (190, 'prune',       'Prune expired records from catalog'),
    (200, 'purge',       'Purge records from catalog'),
    (210, 'python',      'Python control commands'),
    (220, 'quit',        'Terminate Bconsole session'),
    (230, 'query',       'Query catalog'),
    (240, 'restore',     'Restore files'),
    (250, 'relabel',     'Relabel a tape'),
    (260, 'release',     'Release storage'),
    (270, 'reload',      'Reload conf file'),
    (280, 'run',         'Run a job'),
    (290, 'status',      'Report status'),
    (295, 'stop',        'Stop a job'),
    (300, 'setdebug',    'Sets debug level'),
    (305, 'setbandwidth','Sets bandwidth'),
    (310, 'setip',       'Sets new client address, if authorized'),
    (320, 'show',        'Show resource records'),
    (330, 'sqlquery',    'Use SQL to query catalog'),
    (340, 'time',        'Print current time'),
    (350, 'trace',       'Turn on/off trace to file'),
    (355, 'truncate',    'Truncate one or more Volumes'),
    (360, 'unmount',     'Unmount storage'),
    (370, 'umount',      'Umount - for old-time Unix guys, see unmount'),
    (380, 'update',      'Update volume, pool or stats'),
    (390, 'use',         'Use catalog xxx'),
    (400, 'var',         'Does variable expansion'),
    (410, 'version',     'Print Director version'),
    (420, 'wait',        'Wait until no jobs are running');


CREATE TABLE IF NOT EXISTS webacula_fileset_acl (
    id              int(11) NOT NULL AUTO_INCREMENT,
    name            varchar(127) DEFAULT NULL,
    order_acl       int(11) DEFAULT NULL,
    role_id         int(11) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY idx_name (name,role_id),
    KEY idx_id (id,order_acl)
);


CREATE TABLE IF NOT EXISTS webacula_job_acl (
    id              int(11) NOT NULL AUTO_INCREMENT,
    name            varchar(127) DEFAULT NULL,
    order_acl       int(11) DEFAULT NULL,
    role_id         int(11) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY idx_name (name,role_id),
    KEY idx_id (id,order_acl)
);


CREATE TABLE IF NOT EXISTS webacula_pool_acl (
    id              int(11) NOT NULL AUTO_INCREMENT,
    name            varchar(127) DEFAULT NULL,
    order_acl       int(11) DEFAULT NULL,
    role_id         int(11) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY idx_name (name,role_id),
    KEY idx_id (id,order_acl)
);


CREATE TABLE IF NOT EXISTS webacula_storage_acl (
    id              int(11) NOT NULL AUTO_INCREMENT,
    name            varchar(127) DEFAULT NULL,
    order_acl       int(11) DEFAULT NULL,
    role_id         int(11) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY idx_name (name,role_id),
    KEY idx_id (id,order_acl)
);


CREATE TABLE IF NOT EXISTS webacula_where_acl (
    id              int(11) NOT NULL AUTO_INCREMENT,
    name            text NOT NULL,
    order_acl       int(11) DEFAULT NULL,
    role_id         int(11) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY idx_name (name(127),role_id),
    KEY idx_id (id,order_acl)
);


CREATE TABLE IF NOT EXISTS webacula_schedule_acl (
    id              int(11) NOT NULL AUTO_INCREMENT,
    name            varchar(127) DEFAULT NULL,
    order_acl       int(11) DEFAULT NULL,
    role_id         int(11) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (name,role_id),
    KEY idx_id (id,order_acl)
);


-- 'root_role' Bacula ACLs
INSERT INTO webacula_storage_acl   (name, order_acl, role_id)  VALUES ('*all*', 1, 1);
INSERT INTO webacula_pool_acl      (name, order_acl, role_id)  VALUES ('*all*', 1, 1);
INSERT INTO webacula_client_acl    (name, order_acl, role_id)  VALUES ('*all*', 1, 1);
INSERT INTO webacula_fileset_acl   (name, order_acl, role_id)  VALUES ('*all*', 1, 1);
INSERT INTO webacula_where_acl     (name, order_acl, role_id)  VALUES ('*all*', 1, 1);
INSERT INTO webacula_command_acl   (dt_id,role_id) VALUES (1, 1);
INSERT INTO webacula_job_acl       (name, order_acl, role_id)  VALUES ('*all*', 1, 1);
INSERT INTO webacula_schedule_acl  (name, order_acl, role_id)  VALUES ('*all*', 1, 1);


-- 'operator_role' Bacula ACLs
INSERT INTO webacula_storage_acl   (name, order_acl, role_id)  VALUES ('*all*', 1, 2);
INSERT INTO webacula_pool_acl      (name, order_acl, role_id)  VALUES ('*all*', 1, 2);
INSERT INTO webacula_client_acl    (name, order_acl, role_id)  VALUES ('*all*', 1, 2);
INSERT INTO webacula_fileset_acl   (name, order_acl, role_id)  VALUES ('*all*', 1, 2);
INSERT INTO webacula_where_acl     (name, order_acl, role_id)  VALUES ('*all*', 1, 2);
INSERT INTO webacula_command_acl   (dt_id,role_id) VALUES (1, 2);
INSERT INTO webacula_job_acl       (name, order_acl, role_id)  VALUES ('*all*', 1, 2);
INSERT INTO webacula_schedule_acl  (name, order_acl, role_id)  VALUES ('*all*', 1, 2);


-- PHP session storage
CREATE TABLE IF NOT EXISTS webacula_php_session (
    id              char(64) NOT NULL DEFAULT '',
    modified        int(11) DEFAULT NULL,
    lifetime        int(11) DEFAULT NULL,
    data_session    text,
    login           varchar(50) DEFAULT NULL,
    PRIMARY KEY (id)
);

-- Set password to root
update webacula_users set pwd = ('$P$Bnwu4RHq83kpjmDEW5RfRm0ugkrYij1') where login = 'root';
