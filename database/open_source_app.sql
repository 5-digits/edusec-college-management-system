-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 01, 2013 at 07:50 PM
-- Server version: 5.5.24
-- PHP Version: 5.3.10-1ubuntu3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `open_source_blank`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_term`
--

CREATE TABLE IF NOT EXISTS `academic_term` (
  `academic_term_id` int(2) NOT NULL AUTO_INCREMENT,
  `academic_term_name` varchar(30) NOT NULL,
  `academic_term_start_date` date NOT NULL,
  `academic_term_end_date` date NOT NULL,
  `academic_term_period_id` int(11) NOT NULL,
  `academic_term_organization_id` int(2) NOT NULL,
  `current_sem` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`academic_term_id`),
  KEY `fk_period_id` (`academic_term_period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `academic_term_period`
--

CREATE TABLE IF NOT EXISTS `academic_term_period` (
  `academic_terms_period_id` int(2) NOT NULL AUTO_INCREMENT,
  `academic_terms_period_name` varchar(50) DEFAULT NULL,
  `academic_term_period` varchar(10) NOT NULL,
  `academic_terms_period_start_date` date NOT NULL,
  `academic_terms_period_end_date` date NOT NULL,
  `academic_terms_period_organization_id` int(2) NOT NULL,
  `academic_terms_period_created_by` int(2) NOT NULL,
  `academic_terms_period_creation_date` datetime NOT NULL,
  PRIMARY KEY (`academic_terms_period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `academic_term_trans`
--

CREATE TABLE IF NOT EXISTS `academic_term_trans` (
  `academic_term_trans_id` int(2) NOT NULL AUTO_INCREMENT,
  `academic_term_trans_terms_id` int(2) NOT NULL,
  `academic_term_trans_academicterm_period_id` int(2) NOT NULL,
  PRIMARY KEY (`academic_term_trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `assign_company_user_table`
--

CREATE TABLE IF NOT EXISTS `assign_company_user_table` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `assign_user_id` int(5) NOT NULL,
  `assign_role_id` int(2) DEFAULT NULL,
  `assign_org_id` int(2) NOT NULL,
  `assign_created_by` int(9) NOT NULL,
  `assign_creation_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user` (`assign_user_id`),
  KEY `fk_role` (`assign_role_id`),
  KEY `fk_org` (`assign_org_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `AuthAssignment`
--

CREATE TABLE IF NOT EXISTS `AuthAssignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `AuthItem`
--

CREATE TABLE IF NOT EXISTS `AuthItem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AuthItem`
--

INSERT INTO `AuthItem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('AcademicTerm.*', 0, NULL, NULL, 'N;'),
('AcademicTerm.AcademicTermExportExcel', 0, NULL, NULL, 'N;'),
('AcademicTerm.AcademicTermGeneratePdf', 0, NULL, NULL, 'N;'),
('AcademicTerm.Admin', 0, NULL, NULL, 'N;'),
('AcademicTerm.Create', 0, 'AcademicTerm.Create', NULL, 'N;'),
('AcademicTerm.Delete', 0, NULL, NULL, 'N;'),
('AcademicTerm.Index', 0, NULL, NULL, 'N;'),
('AcademicTerm.Update', 0, 'AcademicTerm.Update', NULL, 'N;'),
('AcademicTerm.View', 0, NULL, NULL, 'N;'),
('AcademicTermPeriod.*', 0, NULL, NULL, 'N;'),
('AcademicTermPeriod.AcademicTermPeriodExportExcel', 0, NULL, NULL, 'N;'),
('AcademicTermPeriod.AcademicTermPeriodGeneratePdf', 0, NULL, NULL, 'N;'),
('AcademicTermPeriod.Admin', 0, NULL, NULL, 'N;'),
('AcademicTermPeriod.Create', 0, NULL, NULL, 'N;'),
('AcademicTermPeriod.Delete', 0, NULL, NULL, 'N;'),
('AcademicTermPeriod.Index', 0, NULL, NULL, 'N;'),
('AcademicTermPeriod.Update', 0, NULL, NULL, 'N;'),
('AcademicTermPeriod.View', 0, NULL, NULL, 'N;'),
('Accountant', 2, 'Accountant', NULL, 'N;'),
('Admin', 2, 'Admin of the college', NULL, 'N;'),
('AssignCompanyUserTable.*', 0, NULL, NULL, 'N;'),
('AssignCompanyUserTable.Admin', 0, NULL, NULL, 'N;'),
('AssignCompanyUserTable.Create', 0, NULL, NULL, 'N;'),
('AssignCompanyUserTable.Delete', 0, NULL, NULL, 'N;'),
('AssignCompanyUserTable.Index', 0, NULL, NULL, 'N;'),
('AssignCompanyUserTable.Update', 0, NULL, NULL, 'N;'),
('AssignCompanyUserTable.View', 0, NULL, NULL, 'N;'),
('BankMaster.*', 0, NULL, NULL, 'N;'),
('BankMaster.Admin', 0, NULL, NULL, 'N;'),
('BankMaster.Create', 0, NULL, NULL, 'N;'),
('BankMaster.Delete', 0, NULL, NULL, 'N;'),
('BankMaster.Index', 0, NULL, NULL, 'N;'),
('BankMaster.Update', 0, NULL, NULL, 'N;'),
('BankMaster.View', 0, NULL, NULL, 'N;'),
('Batch.*', 0, NULL, NULL, 'N;'),
('Batch.Admin', 0, NULL, NULL, 'N;'),
('Batch.Create', 0, NULL, NULL, 'N;'),
('Batch.Delete', 0, NULL, NULL, 'N;'),
('Batch.Index', 0, NULL, NULL, 'N;'),
('Batch.Update', 0, NULL, NULL, 'N;'),
('Batch.View', 0, NULL, NULL, 'N;'),
('Branch.*', 0, NULL, NULL, 'N;'),
('Branch.Admin', 0, NULL, NULL, 'N;'),
('Branch.Create', 0, NULL, NULL, 'N;'),
('Branch.Delete', 0, NULL, NULL, 'N;'),
('Branch.Index', 0, NULL, NULL, 'N;'),
('Branch.Update', 0, NULL, NULL, 'N;'),
('Branch.View', 0, NULL, NULL, 'N;'),
('BranchPassoutsemTagTable.*', 0, NULL, NULL, 'N;'),
('BranchPassoutsemTagTable.Admin', 0, 'BranchPassoutsemTagTable.Admin', NULL, 'N;'),
('BranchPassoutsemTagTable.Create', 0, 'BranchPassoutsemTagTable.Create', NULL, 'N;'),
('BranchPassoutsemTagTable.Delete', 0, NULL, NULL, 'N;'),
('BranchPassoutsemTagTable.Index', 0, NULL, NULL, 'N;'),
('BranchPassoutsemTagTable.Update', 0, 'BranchPassoutsemTagTable.Update', NULL, 'N;'),
('BranchPassoutsemTagTable.View', 0, 'BranchPassoutsemTagTable.View', NULL, 'N;'),
('Category.*', 0, NULL, NULL, 'N;'),
('Category.Admin', 0, NULL, NULL, 'N;'),
('Category.Create', 0, NULL, NULL, 'N;'),
('Category.Delete', 0, NULL, NULL, 'N;'),
('Category.Index', 0, NULL, NULL, 'N;'),
('Category.Update', 0, NULL, NULL, 'N;'),
('Category.View', 0, NULL, NULL, 'N;'),
('City.*', 0, NULL, NULL, 'N;'),
('City.Admin', 0, NULL, NULL, 'N;'),
('City.Create', 0, 'City.Create', NULL, 'N;'),
('City.Delete', 0, NULL, NULL, 'N;'),
('City.Index', 0, NULL, NULL, 'N;'),
('City.Update', 0, NULL, NULL, 'N;'),
('City.View', 0, NULL, NULL, 'N;'),
('Configuration', 0, 'Configuration', NULL, 'N;'),
('Controlpanel', 0, 'Controlpanel', NULL, 'N;'),
('Country.*', 0, NULL, NULL, 'N;'),
('Country.Admin', 0, NULL, NULL, 'N;'),
('Country.Create', 0, 'Country.Create', NULL, 'N;'),
('Country.Delete', 0, NULL, NULL, 'N;'),
('Country.Index', 0, NULL, NULL, 'N;'),
('Country.Update', 0, NULL, NULL, 'N;'),
('Country.View', 0, NULL, NULL, 'N;'),
('Dashboard', 0, 'Dashboard', NULL, 'N;'),
('Dashboard.Default.*', 0, NULL, NULL, 'N;'),
('Dashboard.Default.Index', 0, NULL, NULL, 'N;'),
('Dashboard.Default.Save', 0, NULL, NULL, 'N;'),
('Dashboard.DefaultCon.*', 0, NULL, NULL, 'N;'),
('Dashboard.DefaultCon.Index', 0, NULL, NULL, 'N;'),
('Dashboard.DefaultCon.Save', 0, NULL, NULL, 'N;'),
('Department.*', 0, NULL, NULL, 'N;'),
('Department.Admin', 0, NULL, NULL, 'N;'),
('Department.Create', 0, 'Department.Create', NULL, 'N;'),
('Department.Delete', 0, NULL, NULL, 'N;'),
('Department.Index', 0, NULL, NULL, 'N;'),
('Department.Update', 0, NULL, NULL, 'N;'),
('Department.View', 0, NULL, NULL, 'N;'),
('Dependent.*', 0, 'Dependent.*', NULL, 'N;'),
('Dependent.Branchreceiptdivision', 0, NULL, NULL, 'N;'),
('Dependent.UpdateEmpCCities', 0, NULL, NULL, 'N;'),
('Dependent.UpdateEmpCStates', 0, NULL, NULL, 'N;'),
('Dependent.UpdateEmpPCities', 0, NULL, NULL, 'N;'),
('Dependent.UpdateEmpPStates', 0, NULL, NULL, 'N;'),
('Dependent.UpdateStudCCities', 0, NULL, NULL, 'N;'),
('Dependent.UpdateStudCStates', 0, NULL, NULL, 'N;'),
('Dependent.UpdateStudPCities', 0, NULL, NULL, 'N;'),
('Dependent.UpdateStudPStates', 0, NULL, NULL, 'N;'),
('Dependent.View', 0, NULL, NULL, 'N;'),
('Division.*', 0, NULL, NULL, 'N;'),
('Division.Admin', 0, NULL, NULL, 'N;'),
('Division.Create', 0, 'Division.Create', NULL, 'N;'),
('Division.Delete', 0, NULL, NULL, 'N;'),
('Division.Index', 0, NULL, NULL, 'N;'),
('Division.Update', 0, NULL, NULL, 'N;'),
('Division.View', 0, NULL, NULL, 'N;'),
('Document', 0, 'Document', NULL, 'N;'),
('DocumentCategoryMaster.*', 0, 'DocumentCategoryMaster.*', NULL, 'N;'),
('DocumentCategoryMaster.Admin', 0, 'DocumentCategoryMaster.Admin', NULL, 'N;'),
('DocumentCategoryMaster.Create', 0, 'DocumentCategoryMaster.Create', NULL, 'N;'),
('DocumentCategoryMaster.Delete', 0, 'DocumentCategoryMaster.Delete', NULL, 'N;'),
('DocumentCategoryMaster.Index', 0, NULL, NULL, 'N;'),
('DocumentCategoryMaster.Update', 0, 'DocumentCategoryMaster.Update', NULL, 'N;'),
('DocumentCategoryMaster.View', 0, 'DocumentCategoryMaster.View', NULL, 'N;'),
('Eduboard.*', 0, NULL, NULL, 'N;'),
('Eduboard.Admin', 0, NULL, NULL, 'N;'),
('Eduboard.Create', 0, 'Eduboard.Create', NULL, 'N;'),
('Eduboard.Delete', 0, NULL, NULL, 'N;'),
('Eduboard.Index', 0, NULL, NULL, 'N;'),
('Eduboard.Update', 0, 'Eduboard.Update', NULL, 'N;'),
('Eduboard.View', 0, NULL, NULL, 'N;'),
('Employee', 2, 'Employee of the college', NULL, 'N;'),
('EmployeeAcademicRecordTrans.*', 0, NULL, NULL, 'N;'),
('EmployeeAcademicRecordTrans.Admin', 0, 'EmployeeAcademicRecordTrans.Admin', NULL, 'N;'),
('EmployeeAcademicRecordTrans.Create', 0, 'EmployeeAcademicRecordTrans.Create', NULL, 'N;'),
('EmployeeAcademicRecordTrans.Delete', 0, NULL, NULL, 'N;'),
('EmployeeAcademicRecordTrans.EmployeeAcademicRecords', 0, NULL, NULL, 'N;'),
('EmployeeAcademicRecordTrans.Index', 0, NULL, NULL, 'N;'),
('EmployeeAcademicRecordTrans.Update', 0, 'EmployeeAcademicRecordTrans.Update', NULL, 'N;'),
('EmployeeAcademicRecordTrans.View', 0, 'EmployeeAcademicRecordTrans.View', NULL, 'N;'),
('EmployeeAddress.*', 0, NULL, NULL, 'N;'),
('EmployeeAddress.Admin', 0, NULL, NULL, 'N;'),
('EmployeeAddress.Create', 0, NULL, NULL, 'N;'),
('EmployeeAddress.Delete', 0, NULL, NULL, 'N;'),
('EmployeeAddress.Index', 0, NULL, NULL, 'N;'),
('EmployeeAddress.Update', 0, NULL, NULL, 'N;'),
('EmployeeAddress.View', 0, NULL, NULL, 'N;'),
('EmployeeDesignation.*', 0, NULL, NULL, 'N;'),
('EmployeeDesignation.Admin', 0, NULL, NULL, 'N;'),
('EmployeeDesignation.Create', 0, NULL, NULL, 'N;'),
('EmployeeDesignation.Delete', 0, NULL, NULL, 'N;'),
('EmployeeDesignation.Index', 0, NULL, NULL, 'N;'),
('EmployeeDesignation.Update', 0, NULL, NULL, 'N;'),
('EmployeeDesignation.View', 0, NULL, NULL, 'N;'),
('EmployeeDocs.*', 0, NULL, NULL, 'N;'),
('EmployeeDocs.Admin', 0, NULL, NULL, 'N;'),
('EmployeeDocs.Create', 0, NULL, NULL, 'N;'),
('EmployeeDocs.Delete', 0, NULL, NULL, 'N;'),
('EmployeeDocs.Index', 0, NULL, NULL, 'N;'),
('EmployeeDocs.Update', 0, NULL, NULL, 'N;'),
('EmployeeDocs.View', 0, NULL, NULL, 'N;'),
('EmployeeDocsTrans.*', 0, NULL, NULL, 'N;'),
('EmployeeDocsTrans.Admin', 0, NULL, NULL, 'N;'),
('EmployeeDocsTrans.Create', 0, NULL, NULL, 'N;'),
('EmployeeDocsTrans.Delete', 0, NULL, NULL, 'N;'),
('EmployeeDocsTrans.Employeedocs', 0, NULL, NULL, 'N;'),
('EmployeeDocsTrans.Index', 0, NULL, NULL, 'N;'),
('EmployeeDocsTrans.Update', 0, NULL, NULL, 'N;'),
('EmployeeDocsTrans.View', 0, NULL, NULL, 'N;'),
('EmployeeExperienceTrans.*', 0, NULL, NULL, 'N;'),
('EmployeeExperienceTrans.Admin', 0, NULL, NULL, 'N;'),
('EmployeeExperienceTrans.Create', 0, NULL, NULL, 'N;'),
('EmployeeExperienceTrans.Delete', 0, NULL, NULL, 'N;'),
('EmployeeExperienceTrans.EmployeeExperience', 0, NULL, NULL, 'N;'),
('EmployeeExperienceTrans.Index', 0, NULL, NULL, 'N;'),
('EmployeeExperienceTrans.Update', 0, NULL, NULL, 'N;'),
('EmployeeExperienceTrans.View', 0, NULL, NULL, 'N;'),
('EmployeeInfo.*', 0, NULL, NULL, 'N;'),
('EmployeeInfo.Admin', 0, NULL, NULL, 'N;'),
('EmployeeInfo.Create', 0, NULL, NULL, 'N;'),
('EmployeeInfo.Delete', 0, NULL, NULL, 'N;'),
('EmployeeInfo.Index', 0, NULL, NULL, 'N;'),
('EmployeeInfo.Update', 0, NULL, NULL, 'N;'),
('EmployeeInfo.View', 0, NULL, NULL, 'N;'),
('EmployeeLeaveApplication.Leaveerror', 0, 'EmployeeLeaveApplication.Leaveerror', NULL, 'N;'),
('Employeemodule', 0, 'Employeemodule', NULL, 'N;'),
('EmployeePhotos.*', 0, NULL, NULL, 'N;'),
('EmployeePhotos.Admin', 0, NULL, NULL, 'N;'),
('EmployeePhotos.Create', 0, NULL, NULL, 'N;'),
('EmployeePhotos.Delete', 0, NULL, NULL, 'N;'),
('EmployeePhotos.Index', 0, NULL, NULL, 'N;'),
('EmployeePhotos.Update', 0, NULL, NULL, 'N;'),
('EmployeePhotos.View', 0, NULL, NULL, 'N;'),
('EmployeeTransaction.*', 0, NULL, NULL, 'N;'),
('EmployeeTransaction.Admin', 0, NULL, NULL, 'N;'),
('EmployeeTransaction.Create', 0, NULL, NULL, 'N;'),
('EmployeeTransaction.Delete', 0, NULL, NULL, 'N;'),
('EmployeeTransaction.Final_view', 0, 'EmployeeTransaction.Final_view', NULL, 'N;'),
('EmployeeTransaction.Index', 0, NULL, NULL, 'N;'),
('EmployeeTransaction.PhotoDelete', 0, NULL, NULL, 'N;'),
('EmployeeTransaction.Update', 0, NULL, NULL, 'N;'),
('EmployeeTransaction.UpdateCCities', 0, NULL, NULL, 'N;'),
('EmployeeTransaction.UpdateCStates', 0, NULL, NULL, 'N;'),
('EmployeeTransaction.UpdateEmployeeData', 0, 'EmployeeTransaction.UpdateEmployeeData', NULL, 'N;'),
('EmployeeTransaction.UpdatePCities', 0, NULL, NULL, 'N;'),
('EmployeeTransaction.Updateprofilephoto', 0, NULL, NULL, 'N;'),
('EmployeeTransaction.Updateprofiletab1', 0, NULL, NULL, 'N;'),
('EmployeeTransaction.Updateprofiletab2', 0, NULL, NULL, 'N;'),
('EmployeeTransaction.Updateprofiletab3', 0, NULL, NULL, 'N;'),
('EmployeeTransaction.Updateprofiletab4', 0, NULL, NULL, 'N;'),
('EmployeeTransaction.UpdatePStates', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.*', 0, 'ExportToPDFExcel.*', NULL, 'N;'),
('ExportToPDFExcel.AcademicTermExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.AcademicTermExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.AcademicTermPeriodExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.AcademicTermPeriodExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.AdminlibdataExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.BankMasterExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.BankMasterExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.BatchExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.BatchExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.BranchExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.BranchExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.BranchPassoutsemTagExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.BranchPassoutsemTagExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.CategoryExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.CategoryExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.CityExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.CityExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.CountryExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.CountryExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.DepartmentExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.DepartmentExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.DivisionExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.DivisionExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.EducationExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.EducationExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.EmployeedataExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.EmployeeDesignationExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.EmployeeDesignationExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.EmployeeExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.EmployeeExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.EmployeeFinalViewExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.FeedbackcategoryExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.FeedbackcategoryExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.FeedbackMasterExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.FeedbackMasterExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.FeesMasterExportPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.FeesMasterExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.FeesPaymentTypeExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.FeesPaymentTypeExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.GtuNoticeExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.GtuNoticeExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.ImportantNoticeExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.ImportantNoticeExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.LanguageExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.LanguageExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.LeftDetainExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.LeftDetainExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.MiscellaneousFeesExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.MiscellaneousFeesExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.MyAction', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.NationalityExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.NationalityExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.OrganizationExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.OrganizationExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.QualificationExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.QualificationExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.QuotaExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.QuotaExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.ReligionExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.ReligionExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.RoomCategoryExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.RoomCategoryExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.RoomDetailsExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.RoomDetailsExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.ShiftExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.ShiftExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.StateExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.StateExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.StudentdataExportExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.StudentFinalViewExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.StudentStatusExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.StudentStatusExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.StudentTransactionExportExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.StudentTransactionExportPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.TechnicalstaffdataExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.TermExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.TermExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.UserTypeExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.UserTypeExportToPdf', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.YearExportToExcel', 0, NULL, NULL, 'N;'),
('ExportToPDFExcel.YearExportToPdf', 0, NULL, NULL, 'N;'),
('Facultyfeedback', 0, 'Facultyfeedback', NULL, 'N;'),
('FeedbackCategoryMaster.*', 0, 'FeedbackCategoryMaster.*', NULL, 'N;'),
('FeedbackCategoryMaster.Admin', 0, 'FeedbackCategoryMaster.Admin', NULL, 'N;'),
('FeedbackCategoryMaster.Create', 0, 'FeedbackCategoryMaster.Create', NULL, 'N;'),
('FeedbackCategoryMaster.Delete', 0, 'FeedbackCategoryMaster.Delete', NULL, 'N;'),
('FeedbackCategoryMaster.Index', 0, NULL, NULL, 'N;'),
('FeedbackCategoryMaster.Update', 0, 'FeedbackCategoryMaster.Update', NULL, 'N;'),
('FeedbackCategoryMaster.View', 0, 'FeedbackCategoryMaster.View', NULL, 'N;'),
('FeedbackDetails.*', 0, NULL, NULL, 'N;'),
('FeedbackDetails.Admin', 0, NULL, NULL, 'N;'),
('feedbackDetails.Create', 0, 'feedbackDetails.Create', NULL, 'N;'),
('FeedbackDetails.Delete', 0, NULL, NULL, 'N;'),
('FeedbackDetails.Index', 0, NULL, NULL, 'N;'),
('FeedbackDetails.Msg', 0, NULL, NULL, 'N;'),
('FeedbackDetails.Mycreate', 0, NULL, NULL, 'N;'),
('FeedbackDetails.Question', 0, NULL, NULL, 'N;'),
('feedbackDetails.Update', 0, 'feedbackDetails.Update', NULL, 'N;'),
('FeedbackDetails.View', 0, NULL, NULL, 'N;'),
('FeedbackDetailsTable.*', 0, 'FeedbackDetailsTable.*', NULL, 'N;'),
('FeedbackDetailsTable.Admin', 0, 'FeedbackDetailsTable.Admin', NULL, 'N;'),
('FeedbackDetailsTable.Create', 0, 'FeedbackDetailsTable.Create', NULL, 'N;'),
('FeedbackDetailsTable.Delete', 0, 'FeedbackDetailsTable.Delete', NULL, 'N;'),
('FeedbackDetailsTable.Index', 0, NULL, NULL, 'N;'),
('FeedbackDetailsTable.StudentPerformance', 0, NULL, NULL, 'N;'),
('FeedbackDetailsTable.Update', 0, 'FeedbackDetailsTable.Update', NULL, 'N;'),
('FeedbackDetailsTable.View', 0, 'FeedbackDetailsTable.View', NULL, 'N;'),
('FeedbackMaster.*', 0, NULL, NULL, 'N;'),
('FeedbackMaster.Admin', 0, NULL, NULL, 'N;'),
('FeedbackMaster.Create', 0, NULL, NULL, 'N;'),
('FeedbackMaster.Delete', 0, NULL, NULL, 'N;'),
('FeedbackMaster.Index', 0, NULL, NULL, 'N;'),
('FeedbackMaster.Update', 0, NULL, NULL, 'N;'),
('FeedbackMaster.View', 0, NULL, NULL, 'N;'),
('Fees', 0, 'Fees', NULL, 'N;'),
('FeesDetailsMaster.*', 0, NULL, NULL, 'N;'),
('FeesDetailsMaster.Admin', 0, NULL, NULL, 'N;'),
('FeesDetailsMaster.Create', 0, NULL, NULL, 'N;'),
('FeesDetailsMaster.Delete', 0, NULL, NULL, 'N;'),
('FeesDetailsMaster.GenerateExcel', 0, NULL, NULL, 'N;'),
('FeesDetailsMaster.GeneratePdf', 0, NULL, NULL, 'N;'),
('FeesDetailsMaster.Index', 0, NULL, NULL, 'N;'),
('FeesDetailsMaster.Update', 0, NULL, NULL, 'N;'),
('FeesDetailsMaster.View', 0, NULL, NULL, 'N;'),
('FeesDetailsTable.*', 0, NULL, NULL, 'N;'),
('FeesDetailsTable.Admin', 0, NULL, NULL, 'N;'),
('FeesDetailsTable.Create', 0, NULL, NULL, 'N;'),
('FeesDetailsTable.Delete', 0, NULL, NULL, 'N;'),
('FeesDetailsTable.Index', 0, NULL, NULL, 'N;'),
('FeesDetailsTable.Update', 0, NULL, NULL, 'N;'),
('FeesDetailsTable.View', 0, NULL, NULL, 'N;'),
('FeesMaster.*', 0, NULL, NULL, 'N;'),
('FeesMaster.Admin', 0, NULL, NULL, 'N;'),
('FeesMaster.AssignFeesStudent', 0, NULL, NULL, 'N;'),
('FeesMaster.Create', 0, NULL, NULL, 'N;'),
('FeesMaster.Delete', 0, NULL, NULL, 'N;'),
('FeesMaster.GenerateFees', 0, NULL, NULL, 'N;'),
('FeesMaster.GenerateMultipleFees', 0, 'FeesMaster.GenerateMultipleFees', NULL, 'N;'),
('FeesMaster.Index', 0, NULL, NULL, 'N;'),
('FeesMaster.PreviousFeesData', 0, NULL, NULL, 'N;'),
('FeesMaster.Update', 0, NULL, NULL, 'N;'),
('FeesMaster.View', 0, NULL, NULL, 'N;'),
('FeesMasterTransaction.*', 0, NULL, NULL, 'N;'),
('FeesMasterTransaction.Admin', 0, NULL, NULL, 'N;'),
('FeesMasterTransaction.Create', 0, NULL, NULL, 'N;'),
('FeesMasterTransaction.Delete', 0, NULL, NULL, 'N;'),
('FeesMasterTransaction.Index', 0, NULL, NULL, 'N;'),
('FeesMasterTransaction.Update', 0, NULL, NULL, 'N;'),
('FeesMasterTransaction.View', 0, NULL, NULL, 'N;'),
('FeesPaymentCash.*', 0, NULL, NULL, 'N;'),
('FeesPaymentCash.Admin', 0, NULL, NULL, 'N;'),
('FeesPaymentCash.Create', 0, NULL, NULL, 'N;'),
('FeesPaymentCash.Delete', 0, NULL, NULL, 'N;'),
('FeesPaymentCash.Index', 0, NULL, NULL, 'N;'),
('FeesPaymentCash.Update', 0, NULL, NULL, 'N;'),
('FeesPaymentCash.View', 0, NULL, NULL, 'N;'),
('FeesPaymentCheque.*', 0, NULL, NULL, 'N;'),
('FeesPaymentCheque.Admin', 0, NULL, NULL, 'N;'),
('FeesPaymentCheque.Cheque_result', 0, 'FeesPaymentCheque.Cheque_result', NULL, 'N;'),
('FeesPaymentCheque.Cheque_search', 0, 'FeesPaymentCheque.Cheque_search', NULL, 'N;'),
('FeesPaymentCheque.Create', 0, NULL, NULL, 'N;'),
('FeesPaymentCheque.Delete', 0, NULL, NULL, 'N;'),
('FeesPaymentCheque.Index', 0, NULL, NULL, 'N;'),
('FeesPaymentCheque.my_update', 0, 'FeesPaymentCheque.my_update', NULL, 'N;'),
('FeesPaymentCheque.Update', 0, NULL, NULL, 'N;'),
('FeesPaymentCheque.View', 0, NULL, NULL, 'N;'),
('FeesPaymentMethod.*', 0, NULL, NULL, 'N;'),
('FeesPaymentMethod.Admin', 0, NULL, NULL, 'N;'),
('FeesPaymentMethod.Create', 0, NULL, NULL, 'N;'),
('FeesPaymentMethod.Delete', 0, NULL, NULL, 'N;'),
('FeesPaymentMethod.Index', 0, NULL, NULL, 'N;'),
('FeesPaymentMethod.Update', 0, NULL, NULL, 'N;'),
('FeesPaymentMethod.View', 0, NULL, NULL, 'N;'),
('FeesPaymentTransaction.*', 0, NULL, NULL, 'N;'),
('FeesPaymentTransaction.Addfees', 0, NULL, NULL, 'N;'),
('FeesPaymentTransaction.Admin', 0, NULL, NULL, 'N;'),
('FeesPaymentTransaction.Branch_receipt_generate_print', 0, 'FeesPaymentTransaction.Branch_receipt_generate_print', NULL, 'N;'),
('FeesPaymentTransaction.Create', 0, NULL, NULL, 'N;'),
('FeesPaymentTransaction.date_report', 0, 'FeesPaymentTransaction.date_report', NULL, 'N;'),
('FeesPaymentTransaction.Delete', 0, NULL, NULL, 'N;'),
('FeesPaymentTransaction.Error', 0, NULL, NULL, 'N;'),
('FeesPaymentTransaction.Index', 0, NULL, NULL, 'N;'),
('FeesPaymentTransaction.Mis_report', 0, 'FeesPaymentTransaction.Mis_report', NULL, 'N;'),
('FeesPaymentTransaction.Paid', 0, NULL, NULL, 'N;'),
('FeesPaymentTransaction.Payfeescash', 0, NULL, NULL, 'N;'),
('FeesPaymentTransaction.Payfeescheque', 0, NULL, NULL, 'N;'),
('FeesPaymentTransaction.Print_cash_receipt', 0, 'FeesPaymentTransaction.Print_cash_receipt', NULL, 'N;'),
('FeesPaymentTransaction.Print_cheque_receipt', 0, 'FeesPaymentTransaction.Print_cheque_receipt', NULL, 'N;'),
('FeesPaymentTransaction.Receipt_generate_print', 0, 'FeesPaymentTransaction.Receipt_generate_print', NULL, 'N;'),
('FeesPaymentTransaction.StudentFeesReport', 0, 'FeesPaymentTransaction.StudentFeesReport', NULL, 'N;'),
('FeesPaymentTransaction.StudentFeesReportwithoutform', 0, 'FeesPaymentTransaction.StudentFeesReportwithoutform', NULL, 'N;'),
('FeesPaymentTransaction.Total', 0, NULL, NULL, 'N;'),
('FeesPaymentTransaction.UnPaid', 0, NULL, NULL, 'N;'),
('FeesPaymentTransaction.Update', 0, NULL, NULL, 'N;'),
('FeesPaymentTransaction.Update_payfeescash', 0, 'FeesPaymentTransaction.Update_payfeescash', NULL, 'N;'),
('FeesPaymentTransaction.Update_payfeescheque', 0, 'FeesPaymentTransaction.Update_payfeescheque', NULL, 'N;'),
('FeesPaymentTransaction.View', 0, NULL, NULL, 'N;'),
('FeesPaymentType.*', 0, NULL, NULL, 'N;'),
('FeesPaymentType.Admin', 0, NULL, NULL, 'N;'),
('FeesPaymentType.Create', 0, NULL, NULL, 'N;'),
('FeesPaymentType.Delete', 0, NULL, NULL, 'N;'),
('FeesPaymentType.Index', 0, NULL, NULL, 'N;'),
('FeesPaymentType.Update', 0, NULL, NULL, 'N;'),
('FeesPaymentType.View', 0, NULL, NULL, 'N;'),
('FeesReceipt.*', 0, NULL, NULL, 'N;'),
('FeesReceipt.Admin', 0, NULL, NULL, 'N;'),
('FeesReceipt.Create', 0, NULL, NULL, 'N;'),
('FeesReceipt.Delete', 0, NULL, NULL, 'N;'),
('FeesReceipt.Index', 0, NULL, NULL, 'N;'),
('FeesReceipt.Update', 0, NULL, NULL, 'N;'),
('FeesReceipt.View', 0, NULL, NULL, 'N;'),
('FeesTermsAndCondition.*', 0, NULL, NULL, 'N;'),
('FeesTermsAndCondition.Admin', 0, NULL, NULL, 'N;'),
('FeesTermsAndCondition.Create', 0, NULL, NULL, 'N;'),
('FeesTermsAndCondition.Delete', 0, NULL, NULL, 'N;'),
('FeesTermsAndCondition.Index', 0, NULL, NULL, 'N;'),
('FeesTermsAndCondition.Update', 0, NULL, NULL, 'N;'),
('FeesTermsAndCondition.View', 0, NULL, NULL, 'N;'),
('Givefeedback.*', 0, NULL, NULL, 'N;'),
('Givefeedback.Admin', 0, NULL, NULL, 'N;'),
('Givefeedback.Create', 0, NULL, NULL, 'N;'),
('Givefeedback.Delete', 0, NULL, NULL, 'N;'),
('Givefeedback.Index', 0, NULL, NULL, 'N;'),
('Givefeedback.Update', 0, NULL, NULL, 'N;'),
('Givefeedback.View', 0, NULL, NULL, 'N;'),
('Gtunotice.*', 0, NULL, NULL, 'N;'),
('Gtunotice.Admin', 0, NULL, NULL, 'N;'),
('Gtunotice.Create', 0, NULL, NULL, 'N;'),
('Gtunotice.Delete', 0, NULL, NULL, 'N;'),
('Gtunotice.Index', 0, NULL, NULL, 'N;'),
('Gtunotice.Update', 0, NULL, NULL, 'N;'),
('Gtunotice.View', 0, NULL, NULL, 'N;'),
('HOD', 2, 'HOD', NULL, 'N;'),
('HR Section', 2, 'HR Section', NULL, 'N;'),
('ImportantNotice.*', 0, NULL, NULL, 'N;'),
('ImportantNotice.Admin', 0, NULL, NULL, 'N;'),
('ImportantNotice.Create', 0, NULL, NULL, 'N;'),
('ImportantNotice.Delete', 0, NULL, NULL, 'N;'),
('ImportantNotice.Index', 0, NULL, NULL, 'N;'),
('ImportantNotice.Update', 0, NULL, NULL, 'N;'),
('ImportantNotice.View', 0, NULL, NULL, 'N;'),
('Languages.*', 0, NULL, NULL, 'N;'),
('Languages.Admin', 0, NULL, NULL, 'N;'),
('Languages.Create', 0, 'Languages.Create', NULL, 'N;'),
('Languages.Delete', 0, NULL, NULL, 'N;'),
('Languages.Index', 0, NULL, NULL, 'N;'),
('Languages.Update', 0, 'Languages.Update', NULL, 'N;'),
('Languages.View', 0, NULL, NULL, 'N;'),
('LanguagesKnown.*', 0, NULL, NULL, 'N;'),
('LanguagesKnown.Admin', 0, NULL, NULL, 'N;'),
('LanguagesKnown.Create', 0, NULL, NULL, 'N;'),
('LanguagesKnown.Delete', 0, NULL, NULL, 'N;'),
('LanguagesKnown.Index', 0, NULL, NULL, 'N;'),
('LanguagesKnown.Update', 0, NULL, NULL, 'N;'),
('LanguagesKnown.View', 0, NULL, NULL, 'N;'),
('MessageOfDay.*', 0, NULL, NULL, 'N;'),
('MessageOfDay.Admin', 0, NULL, NULL, 'N;'),
('MessageOfDay.Create', 0, NULL, NULL, 'N;'),
('MessageOfDay.Delete', 0, NULL, NULL, 'N;'),
('MessageOfDay.Index', 0, NULL, NULL, 'N;'),
('MessageOfDay.Update', 0, NULL, NULL, 'N;'),
('MessageOfDay.View', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesMaster.*', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesMaster.Admin', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesMaster.Create', 0, 'MiscellaneousFeesMaster.Create', NULL, 'N;'),
('MiscellaneousFeesMaster.Delete', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesMaster.Index', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesMaster.Update', 0, 'MiscellaneousFeesMaster.Update', NULL, 'N;'),
('MiscellaneousFeesMaster.View', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentCash.*', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentCash.Admin', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentCash.Create', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentCash.Delete', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentCash.Index', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentCash.Update', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentCash.View', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentCheque.*', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentCheque.Admin', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentCheque.Create', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentCheque.Delete', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentCheque.Index', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentCheque.Update', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentCheque.View', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentTransaction.*', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentTransaction.Admin', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentTransaction.Create', 0, 'MiscellaneousFeesPaymentTransaction.Create', NULL, 'N;'),
('MiscellaneousFeesPaymentTransaction.Delete', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentTransaction.Index', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentTransaction.Madmin', 0, 'MiscellaneousFeesPaymentTransaction.Madmin', NULL, 'N;'),
('MiscellaneousFeesPaymentTransaction.Update', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesPaymentTransaction.View', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesReceipt.*', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesReceipt.Admin', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesReceipt.Create', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesReceipt.Delete', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesReceipt.Index', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesReceipt.Update', 0, NULL, NULL, 'N;'),
('MiscellaneousFeesReceipt.View', 0, NULL, NULL, 'N;'),
('Nationality.*', 0, NULL, NULL, 'N;'),
('Nationality.Admin', 0, NULL, NULL, 'N;'),
('Nationality.Create', 0, 'Nationality.Create', NULL, 'N;'),
('Nationality.Delete', 0, NULL, NULL, 'N;'),
('Nationality.Index', 0, NULL, NULL, 'N;'),
('Nationality.Update', 0, 'Nationality.Update', NULL, 'N;'),
('Nationality.View', 0, NULL, NULL, 'N;'),
('Notifyii.ModelNotifyii.*', 0, NULL, NULL, 'N;'),
('Notifyii.ModelNotifyii.Admin', 0, NULL, NULL, 'N;'),
('Notifyii.ModelNotifyii.Aggregate', 0, NULL, NULL, 'N;'),
('Notifyii.ModelNotifyii.Create', 0, NULL, NULL, 'N;'),
('Notifyii.ModelNotifyii.Delete', 0, NULL, NULL, 'N;'),
('Notifyii.ModelNotifyii.Update', 0, NULL, NULL, 'N;'),
('Notifyii.ModelNotifyii.View', 0, NULL, NULL, 'N;'),
('Organization.*', 0, NULL, NULL, 'N;'),
('Organization.Admin', 0, NULL, NULL, 'N;'),
('Organization.Create', 0, NULL, NULL, 'N;'),
('Organization.Delete', 0, NULL, NULL, 'N;'),
('Organization.Index', 0, NULL, NULL, 'N;'),
('Organization.Update', 0, NULL, NULL, 'N;'),
('Organization.UpdateCities', 0, NULL, NULL, 'N;'),
('Organization.UpdateStates', 0, NULL, NULL, 'N;'),
('Organization.View', 0, NULL, NULL, 'N;'),
('Photogallery', 0, 'Photogallery', NULL, 'N;'),
('PhotoGallery.*', 0, NULL, NULL, 'N;'),
('PhotoGallery.Admin', 0, 'PhotoGallery.Admin', NULL, 'N;'),
('PhotoGallery.Create', 0, NULL, NULL, 'N;'),
('PhotoGallery.Delete', 0, NULL, NULL, 'N;'),
('PhotoGallery.Index', 0, NULL, NULL, 'N;'),
('PhotoGallery.Update', 0, NULL, NULL, 'N;'),
('PhotoGallery.View', 0, NULL, NULL, 'N;'),
('Qualification.*', 0, NULL, NULL, 'N;'),
('Qualification.Admin', 0, NULL, NULL, 'N;'),
('Qualification.Create', 0, 'Qualification.Create', NULL, 'N;'),
('Qualification.Delete', 0, NULL, NULL, 'N;'),
('Qualification.Index', 0, NULL, NULL, 'N;'),
('Qualification.Update', 0, 'Qualification.Update', NULL, 'N;'),
('Qualification.View', 0, NULL, NULL, 'N;'),
('Quota.*', 0, NULL, NULL, 'N;'),
('Quota.Admin', 0, NULL, NULL, 'N;'),
('Quota.Create', 0, 'Quota.Create', NULL, 'N;'),
('Quota.Delete', 0, NULL, NULL, 'N;'),
('Quota.Index', 0, NULL, NULL, 'N;'),
('Quota.Update', 0, 'Quota.Update', NULL, 'N;'),
('Quota.View', 0, NULL, NULL, 'N;'),
('Religion.*', 0, NULL, NULL, 'N;'),
('Religion.Admin', 0, NULL, NULL, 'N;'),
('Religion.Create', 0, 'Religion.Create', NULL, 'N;'),
('Religion.Delete', 0, NULL, NULL, 'N;'),
('Religion.Index', 0, NULL, NULL, 'N;'),
('Religion.Update', 0, 'Religion.Update', NULL, 'N;'),
('Religion.View', 0, NULL, NULL, 'N;'),
('Report.*', 0, NULL, NULL, 'N;'),
('Report.Documentsearch', 0, 'Report.Documentsearch', NULL, 'N;'),
('Report.Documentsearchview', 0, 'Report.Documentsearchview', NULL, 'N;'),
('Report.Employeeid', 0, NULL, NULL, 'N;'),
('Report.EmployeeInfoReport', 0, NULL, NULL, 'N;'),
('Report.PostLabelStudent', 0, NULL, NULL, 'N;'),
('Report.SelectedEmployeeList', 0, NULL, NULL, 'N;'),
('Report.SelectedList', 0, NULL, NULL, 'N;'),
('Report.StudentDocumentsearch', 0, 'Report.StudentDocumentsearch', NULL, 'N;'),
('Report.Studentdocumentsearchview', 0, 'Report.Studentdocumentsearchview', NULL, 'N;'),
('Report.Studenthistory', 0, NULL, NULL, 'N;'),
('Report.Studentid', 0, NULL, NULL, 'N;'),
('Report.StudInfoReport', 0, NULL, NULL, 'N;'),
('Report.View', 0, NULL, NULL, 'N;'),
('Reports', 0, 'Reports', NULL, 'N;'),
('Resetlogin', 0, 'Resetlogin', NULL, 'N;'),
('Resetpassword', 0, 'Resetpassword', NULL, 'N;'),
('Room', 0, 'Room', NULL, 'N;'),
('RoomCategory.*', 0, NULL, NULL, 'N;'),
('RoomCategory.Admin', 0, NULL, NULL, 'N;'),
('RoomCategory.Create', 0, 'RoomCategory.Create', NULL, 'N;'),
('RoomCategory.Delete', 0, NULL, NULL, 'N;'),
('RoomCategory.Index', 0, NULL, NULL, 'N;'),
('RoomCategory.Update', 0, 'RoomCategory.Update', NULL, 'N;'),
('RoomCategory.View', 0, NULL, NULL, 'N;'),
('RoomDetailsMaster.*', 0, NULL, NULL, 'N;'),
('RoomDetailsMaster.Admin', 0, NULL, NULL, 'N;'),
('RoomDetailsMaster.Create', 0, 'RoomDetailsMaster.Create', NULL, 'N;'),
('RoomDetailsMaster.Delete', 0, NULL, NULL, 'N;'),
('RoomDetailsMaster.Index', 0, NULL, NULL, 'N;'),
('RoomDetailsMaster.Update', 0, 'RoomDetailsMaster.Update', NULL, 'N;'),
('RoomDetailsMaster.View', 0, NULL, NULL, 'N;'),
('Shift.*', 0, NULL, NULL, 'N;'),
('Shift.Admin', 0, NULL, NULL, 'N;'),
('Shift.Create', 0, 'Shift.Create', NULL, 'N;'),
('Shift.Delete', 0, NULL, NULL, 'N;'),
('Shift.Index', 0, NULL, NULL, 'N;'),
('Shift.Update', 0, 'Shift.Update', NULL, 'N;'),
('Shift.View', 0, NULL, NULL, 'N;'),
('Site.*', 0, NULL, NULL, 'N;'),
('Site.Contact', 0, NULL, NULL, 'N;'),
('Site.Error', 0, NULL, NULL, 'N;'),
('Site.Index', 0, NULL, NULL, 'N;'),
('Site.Login', 0, NULL, NULL, 'N;'),
('Site.Logout', 0, NULL, NULL, 'N;'),
('Site.Send_sms', 0, 'Site.Send_sms', NULL, 'N;'),
('Site.Test', 0, NULL, NULL, 'N;'),
('Site.UpdateCities', 0, NULL, NULL, 'N;'),
('Site.UpdateStates', 0, NULL, NULL, 'N;'),
('Smsemail', 0, 'Smsemail', NULL, 'N;'),
('State.*', 0, NULL, NULL, 'N;'),
('State.Admin', 0, NULL, NULL, 'N;'),
('State.Create', 0, 'State.Create', NULL, 'N;'),
('State.Delete', 0, NULL, NULL, 'N;'),
('State.Index', 0, NULL, NULL, 'N;'),
('State.Update', 0, 'State.Update', NULL, 'N;'),
('State.View', 0, NULL, NULL, 'N;'),
('Student', 2, 'Student of the college', NULL, 'N;'),
('Student Section', 2, 'Student Section', NULL, 'N;'),
('StudentAcademicRecordTrans.*', 0, 'StudentAcademicRecordTrans.*', NULL, 'N;'),
('StudentAcademicRecordTrans.Admin', 0, 'StudentAcademicRecordTrans.Admin', NULL, 'N;'),
('StudentAcademicRecordTrans.Create', 0, 'StudentAcademicRecordTrans.Create', NULL, 'N;'),
('StudentAcademicRecordTrans.Delete', 0, NULL, NULL, 'N;'),
('StudentAcademicRecordTrans.Index', 0, NULL, NULL, 'N;'),
('StudentAcademicRecordTrans.StudentAcademicRecords', 0, NULL, NULL, 'N;'),
('StudentAcademicRecordTrans.Update', 0, 'StudentAcademicRecordTrans.Update', NULL, 'N;'),
('StudentAcademicRecordTrans.View', 0, 'StudentAcademicRecordTrans.View', NULL, 'N;'),
('StudentAddress.*', 0, NULL, NULL, 'N;'),
('StudentAddress.Admin', 0, NULL, NULL, 'N;'),
('StudentAddress.Create', 0, NULL, NULL, 'N;'),
('StudentAddress.Delete', 0, NULL, NULL, 'N;'),
('StudentAddress.Index', 0, NULL, NULL, 'N;'),
('StudentAddress.Update', 0, NULL, NULL, 'N;'),
('StudentAddress.View', 0, NULL, NULL, 'N;'),
('StudentArchiveTable.*', 0, NULL, NULL, 'N;'),
('StudentArchiveTable.Admin', 0, NULL, NULL, 'N;'),
('StudentArchiveTable.Create', 0, NULL, NULL, 'N;'),
('StudentArchiveTable.Delete', 0, NULL, NULL, 'N;'),
('StudentArchiveTable.Index', 0, NULL, NULL, 'N;'),
('StudentArchiveTable.Update', 0, NULL, NULL, 'N;'),
('StudentArchiveTable.View', 0, NULL, NULL, 'N;'),
('StudentDocs.*', 0, NULL, NULL, 'N;'),
('StudentDocs.Admin', 0, NULL, NULL, 'N;'),
('StudentDocs.Create', 0, NULL, NULL, 'N;'),
('StudentDocs.Delete', 0, NULL, NULL, 'N;'),
('StudentDocs.Index', 0, NULL, NULL, 'N;'),
('StudentDocs.Update', 0, NULL, NULL, 'N;'),
('StudentDocs.View', 0, NULL, NULL, 'N;'),
('StudentDocsTrans.*', 0, NULL, NULL, 'N;'),
('StudentDocsTrans.Admin', 0, NULL, NULL, 'N;'),
('StudentDocsTrans.Create', 0, NULL, NULL, 'N;'),
('StudentDocsTrans.Delete', 0, NULL, NULL, 'N;'),
('StudentDocsTrans.Index', 0, NULL, NULL, 'N;'),
('StudentDocsTrans.StudentDocs', 0, NULL, NULL, 'N;'),
('StudentDocsTrans.Update', 0, NULL, NULL, 'N;'),
('StudentDocsTrans.View', 0, NULL, NULL, 'N;'),
('StudentFeesMaster.*', 0, NULL, NULL, 'N;'),
('StudentFeesMaster.Addotherfees', 0, NULL, NULL, 'N;'),
('StudentFeesMaster.Admin', 0, NULL, NULL, 'N;'),
('StudentFeesMaster.AssignFeesStudent', 0, 'StudentFeesMaster.AssignFeesStudent', NULL, 'N;'),
('StudentFeesMaster.Create', 0, NULL, NULL, 'N;'),
('StudentFeesMaster.Delete', 0, NULL, NULL, 'N;'),
('StudentFeesMaster.DeleteFees', 0, NULL, NULL, 'N;'),
('StudentFeesMaster.FeesAssign', 0, 'StudentFeesMaster.FeesAssign', NULL, 'N;'),
('StudentFeesMaster.Index', 0, NULL, NULL, 'N;'),
('StudentFeesMaster.Myfees', 0, 'StudentFeesMaster.Myfees', NULL, 'N;'),
('StudentFeesMaster.Update', 0, NULL, NULL, 'N;'),
('StudentFeesMaster.View', 0, NULL, NULL, 'N;'),
('StudentInfo.*', 0, NULL, NULL, 'N;'),
('StudentInfo.Admin', 0, NULL, NULL, 'N;'),
('StudentInfo.Create', 0, NULL, NULL, 'N;'),
('StudentInfo.Delete', 0, NULL, NULL, 'N;'),
('StudentInfo.Index', 0, NULL, NULL, 'N;'),
('StudentInfo.Update', 0, NULL, NULL, 'N;'),
('StudentInfo.View', 0, NULL, NULL, 'N;'),
('Studentmodule', 0, 'Studentmodule', NULL, 'N;'),
('StudentPhotos.*', 0, NULL, NULL, 'N;'),
('StudentPhotos.Admin', 0, NULL, NULL, 'N;'),
('StudentPhotos.Create', 0, NULL, NULL, 'N;'),
('StudentPhotos.Delete', 0, NULL, NULL, 'N;'),
('StudentPhotos.Index', 0, NULL, NULL, 'N;'),
('StudentPhotos.Update', 0, NULL, NULL, 'N;'),
('StudentPhotos.View', 0, NULL, NULL, 'N;'),
('Studentstatusmaster.*', 0, NULL, NULL, 'N;'),
('Studentstatusmaster.Admin', 0, 'Studentstatusmaster.Admin', NULL, 'N;'),
('Studentstatusmaster.Create', 0, 'Studentstatusmaster.Create', NULL, 'N;'),
('Studentstatusmaster.Delete', 0, NULL, NULL, 'N;'),
('Studentstatusmaster.Index', 0, NULL, NULL, 'N;'),
('Studentstatusmaster.Update', 0, 'Studentstatusmaster.Update', NULL, 'N;'),
('Studentstatusmaster.View', 0, 'Studentstatusmaster.View', NULL, 'N;'),
('StudentTransaction.*', 0, NULL, NULL, 'N;'),
('StudentTransaction.Admin', 0, NULL, NULL, 'N;'),
('StudentTransaction.Create', 0, NULL, NULL, 'N;'),
('StudentTransaction.Delete', 0, NULL, NULL, 'N;'),
('StudentTransaction.Final_view', 0, 'StudentTransaction.Final_view', NULL, 'N;'),
('StudentTransaction.Index', 0, NULL, NULL, 'N;'),
('StudentTransaction.PhotoDelete', 0, NULL, NULL, 'N;'),
('StudentTransaction.Update', 0, NULL, NULL, 'N;'),
('StudentTransaction.UpdateCCities', 0, NULL, NULL, 'N;'),
('StudentTransaction.UpdateCStates', 0, NULL, NULL, 'N;'),
('StudentTransaction.UpdatePCities', 0, NULL, NULL, 'N;'),
('StudentTransaction.Updateprofilephoto', 0, NULL, NULL, 'N;'),
('StudentTransaction.Updateprofiletab1', 0, NULL, NULL, 'N;'),
('StudentTransaction.Updateprofiletab2', 0, NULL, NULL, 'N;'),
('StudentTransaction.Updateprofiletab3', 0, NULL, NULL, 'N;'),
('StudentTransaction.Updateprofiletab4', 0, NULL, NULL, 'N;'),
('StudentTransaction.UpdatePStates', 0, NULL, NULL, 'N;'),
('StudentTransaction.UpdateStudentData', 0, 'StudentTransaction.UpdateStudentData', NULL, 'N;'),
('StudentTransaction.View', 0, NULL, NULL, 'N;'),
('SuperAdmin', 2, NULL, NULL, 'N;'),
('User.*', 0, NULL, NULL, 'N;'),
('User.Admin', 0, NULL, NULL, 'N;'),
('User.Change', 0, 'User.Change', NULL, 'N;'),
('User.Create', 0, NULL, NULL, 'N;'),
('User.Delete', 0, NULL, NULL, 'N;'),
('User.Index', 0, NULL, NULL, 'N;'),
('User.Resetadminpassword', 0, NULL, NULL, 'N;'),
('User.Resetemploginid', 0, NULL, NULL, 'N;'),
('User.Resetemppassword', 0, NULL, NULL, 'N;'),
('User.Resetstudloginid', 0, NULL, NULL, 'N;'),
('User.Resetstudpassword', 0, NULL, NULL, 'N;'),
('User.Update', 0, NULL, NULL, 'N;'),
('User.Updateemploginid', 0, NULL, NULL, 'N;'),
('User.Updatestudloginid', 0, NULL, NULL, 'N;'),
('User.update_admin_password', 0, 'User.update_admin_password', NULL, 'N;'),
('User.View', 0, NULL, NULL, 'N;'),
('UserType.*', 0, NULL, NULL, 'N;'),
('UserType.Admin', 0, NULL, NULL, 'N;'),
('UserType.Create', 0, NULL, NULL, 'N;'),
('UserType.Delete', 0, NULL, NULL, 'N;'),
('UserType.Index', 0, NULL, NULL, 'N;'),
('UserType.Update', 0, NULL, NULL, 'N;'),
('UserType.View', 0, NULL, NULL, 'N;'),
('Year.*', 0, NULL, NULL, 'N;'),
('Year.Admin', 0, 'Year.Admin', NULL, 'N;'),
('Year.Create', 0, 'Year.Create', NULL, 'N;'),
('Year.Delete', 0, NULL, NULL, 'N;'),
('Year.Index', 0, NULL, NULL, 'N;'),
('Year.Update', 0, 'Year.Update', NULL, 'N;'),
('Year.View', 0, 'Year.View', NULL, 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `AuthItemChild`
--

CREATE TABLE IF NOT EXISTS `AuthItemChild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AuthItemChild`
--

INSERT INTO `AuthItemChild` (`parent`, `child`) VALUES
('Admin', 'AcademicTerm.Admin'),
('Student Section', 'AcademicTerm.Admin'),
('Student Section', 'AcademicTerm.Create'),
('Student Section', 'AcademicTerm.Update'),
('Admin', 'AcademicTerm.View'),
('Student Section', 'AcademicTerm.View'),
('Admin', 'AcademicTermPeriod.*'),
('Admin', 'AcademicTermPeriod.Admin'),
('Student Section', 'AcademicTermPeriod.Admin'),
('Admin', 'AcademicTermPeriod.Create'),
('Student Section', 'AcademicTermPeriod.Create'),
('Admin', 'AcademicTermPeriod.Update'),
('Student Section', 'AcademicTermPeriod.Update'),
('Admin', 'AcademicTermPeriod.View'),
('Student Section', 'AcademicTermPeriod.View'),
('Student', 'Alumni'),
('Student', 'Alumni.AlumniStudentRegistration.Admin'),
('Admin', 'Assets.*'),
('Admin', 'Assets.Admin'),
('Admin', 'Assets.Create'),
('Admin', 'Assets.New_view'),
('Admin', 'Assets.Update'),
('Admin', 'Assets.View'),
('Admin', 'AssetsDetails.*'),
('Admin', 'AssetsDetails.Admin'),
('Admin', 'AssetsDetails.Create'),
('Admin', 'AssetsDetails.Update'),
('Admin', 'AssetsDetails.View'),
('Admin', 'AssignCompanyUserTable.*'),
('Admin', 'AssignCompanyUserTable.Admin'),
('Admin', 'AssignCompanyUserTable.Update'),
('Admin', 'AssignCompanyUserTable.View'),
('Admin', 'AssignSubject.*'),
('Admin', 'Attendence.Admin'),
('Employee', 'Attendence.Admin'),
('Employee', 'Attendence.AllDate'),
('Employee', 'Attendence.Attendencedivisionreport'),
('Employee', 'Attendence.Chart'),
('Employee', 'Attendence.ChartReport'),
('HOD', 'Attendence.ChartReport'),
('Employee', 'Attendence.Create'),
('Employee', 'Attendence.DisplayChart'),
('HOD', 'Attendence.DisplayChart'),
('Employee', 'Attendence.Index'),
('Employee', 'Attendence.Monthview'),
('Student', 'Attendence.Monthview'),
('Employee', 'Attendence.Monthwise_attend_report'),
('Employee', 'Attendence.Popbrowser'),
('Employee', 'Attendence.Show_Student_View'),
('Employee', 'Attendence.StudentAttendenceReport'),
('Student', 'Attendence.StudentAttendenceReport'),
('Student Section', 'Attendence.Studentwisereportpdf'),
('Employee', 'Attendence.Studentwise_report'),
('HOD', 'Attendence.Studentwise_report'),
('Employee', 'Attendence.Update'),
('HOD', 'Attendence.Update'),
('Admin', 'Attendence.View'),
('Employee', 'Attendence.View'),
('Employee', 'Attendence.Viewchart'),
('Accountant', 'BankMaster.*'),
('Admin', 'BankMaster.*'),
('Admin', 'BankMaster.Admin'),
('Admin', 'BankMaster.Create'),
('Admin', 'BankMaster.Update'),
('Admin', 'BankMaster.View'),
('Admin', 'Batch.*'),
('Admin', 'Batch.Admin'),
('Employee', 'Batch.Admin'),
('Student Section', 'Batch.Admin'),
('Admin', 'Batch.Create'),
('Student Section', 'Batch.Create'),
('Admin', 'Batch.Update'),
('Student Section', 'Batch.Update'),
('Admin', 'Batch.View'),
('Employee', 'Batch.View'),
('Student Section', 'Batch.View'),
('Admin', 'BlockUserTable.*'),
('Admin', 'Branch.*'),
('Admin', 'Branch.Admin'),
('Employee', 'Branch.Admin'),
('Student Section', 'Branch.Admin'),
('Admin', 'Branch.Create'),
('Student Section', 'Branch.Create'),
('Admin', 'Branch.Update'),
('Student Section', 'Branch.Update'),
('Admin', 'Branch.View'),
('Employee', 'Branch.View'),
('Student Section', 'Branch.View'),
('Employee', 'BranchPassoutsemTagTable.Admin'),
('Student Section', 'BranchPassoutsemTagTable.Admin'),
('Student Section', 'BranchPassoutsemTagTable.Create'),
('Student Section', 'BranchPassoutsemTagTable.Update'),
('Employee', 'BranchPassoutsemTagTable.View'),
('Student Section', 'BranchPassoutsemTagTable.View'),
('Admin', 'Category.*'),
('Admin', 'Category.Admin'),
('Student Section', 'Category.Admin'),
('Admin', 'Category.Create'),
('Student Section', 'Category.Create'),
('Admin', 'Category.Update'),
('Student Section', 'Category.Update'),
('Admin', 'Category.View'),
('Student Section', 'Category.View'),
('HR Section', 'Certificate'),
('Student Section', 'Certificate'),
('HR Section', 'Certificate.Admin'),
('Student Section', 'Certificate.Admin'),
('Student Section', 'Certificate.certificategeneration'),
('HR Section', 'Certificate.Create'),
('Student Section', 'Certificate.Create'),
('HR Section', 'Certificate.EmployeeCertificategeneration'),
('HR Section', 'Certificate.generatecertificate'),
('Student Section', 'Certificate.generatecertificate'),
('HR Section', 'Certificate.Index'),
('HR Section', 'Certificate.Update'),
('Student Section', 'Certificate.Update'),
('HR Section', 'Certificate.View'),
('Student Section', 'Certificate.View'),
('Admin', 'City.*'),
('Admin', 'City.Admin'),
('Student Section', 'City.Admin'),
('Admin', 'City.Update'),
('Admin', 'City.View'),
('Student Section', 'City.View'),
('Student Section', 'Configuration'),
('Admin', 'Country.*'),
('Admin', 'Country.Admin'),
('Student Section', 'Country.Admin'),
('Admin', 'Country.Update'),
('Admin', 'Country.View'),
('Student Section', 'Country.View'),
('Employee', 'Dashboard'),
('Admin', 'Department.*'),
('Admin', 'Department.Admin'),
('Student Section', 'Department.Admin'),
('Student Section', 'Department.Create'),
('Admin', 'Department.Update'),
('Student Section', 'Department.Update'),
('Admin', 'Department.View'),
('Student Section', 'Department.View'),
('Accountant', 'Dependent.*'),
('Admin', 'Dependent.*'),
('Employee', 'Dependent.*'),
('HOD', 'Dependent.*'),
('HR Section', 'Dependent.*'),
('Student', 'Dependent.*'),
('Student Section', 'Dependent.*'),
('Employee', 'Dependent.View'),
('HR Section', 'DependentC.*'),
('Employee', 'DependentC.View'),
('Admin', 'Division.*'),
('Admin', 'Division.Admin'),
('Student Section', 'Division.Admin'),
('Student Section', 'Division.Create'),
('Admin', 'Division.Update'),
('Student Section', 'Division.Update'),
('Admin', 'Division.View'),
('Student Section', 'Division.View'),
('HR Section', 'Document'),
('Student Section', 'Document'),
('HR Section', 'DocumentCategoryMaster.Admin'),
('Student Section', 'DocumentCategoryMaster.Admin'),
('HR Section', 'DocumentCategoryMaster.Create'),
('Student Section', 'DocumentCategoryMaster.Create'),
('HR Section', 'DocumentCategoryMaster.Index'),
('HR Section', 'DocumentCategoryMaster.Update'),
('Student Section', 'DocumentCategoryMaster.Update'),
('Employee', 'DocumentCategoryMaster.View'),
('HR Section', 'DocumentCategoryMaster.View'),
('Student Section', 'DocumentCategoryMaster.View'),
('Admin', 'Eduboard.Admin'),
('Student Section', 'Eduboard.Admin'),
('Student Section', 'Eduboard.Create'),
('Student Section', 'Eduboard.Update'),
('Admin', 'Eduboard.View'),
('Student Section', 'Eduboard.View'),
('Admin', 'EmployeeAcademicRecordTrans.*'),
('Employee', 'EmployeeAcademicRecordTrans.Admin'),
('HR Section', 'EmployeeAcademicRecordTrans.Admin'),
('HR Section', 'EmployeeAcademicRecordTrans.Create'),
('Employee', 'EmployeeAcademicRecordTrans.EmployeeAcademicRecords'),
('HR Section', 'EmployeeAcademicRecordTrans.Index'),
('HR Section', 'EmployeeAcademicRecordTrans.Update'),
('Employee', 'EmployeeAcademicRecordTrans.View'),
('HR Section', 'EmployeeAcademicRecordTrans.View'),
('Employee', 'EmployeeAddress.Admin'),
('Employee', 'EmployeeAddress.View'),
('HR Section', 'EmployeeCertificateDetailsTable.Admin'),
('Employee', 'EmployeeCertificateDetailsTable.EmployeeCertificates'),
('HR Section', 'EmployeeCertificateDetailsTable.View'),
('Admin', 'EmployeeDesignation.*'),
('Admin', 'EmployeeDesignation.Admin'),
('Employee', 'EmployeeDesignation.Admin'),
('Admin', 'EmployeeDesignation.Create'),
('Admin', 'EmployeeDesignation.Update'),
('Admin', 'EmployeeDesignation.View'),
('Employee', 'EmployeeDesignation.View'),
('Admin', 'EmployeeDocs.*'),
('Admin', 'EmployeeDocs.Admin'),
('Employee', 'EmployeeDocs.Admin'),
('HR Section', 'EmployeeDocs.Admin'),
('Admin', 'EmployeeDocs.Create'),
('HR Section', 'EmployeeDocs.Create'),
('Admin', 'EmployeeDocs.Update'),
('HR Section', 'EmployeeDocs.Update'),
('Admin', 'EmployeeDocs.View'),
('Employee', 'EmployeeDocs.View'),
('HR Section', 'EmployeeDocs.View'),
('Admin', 'EmployeeDocsTrans.*'),
('Admin', 'EmployeeDocsTrans.Admin'),
('Employee', 'EmployeeDocsTrans.Admin'),
('HR Section', 'EmployeeDocsTrans.Admin'),
('Admin', 'EmployeeDocsTrans.Create'),
('HR Section', 'EmployeeDocsTrans.Create'),
('Employee', 'EmployeeDocsTrans.Employeedocs'),
('Admin', 'EmployeeDocsTrans.Update'),
('HR Section', 'EmployeeDocsTrans.Update'),
('Admin', 'EmployeeDocsTrans.View'),
('Employee', 'EmployeeDocsTrans.View'),
('HR Section', 'EmployeeDocsTrans.View'),
('Admin', 'EmployeeExperienceTrans.*'),
('Admin', 'EmployeeExperienceTrans.Admin'),
('Employee', 'EmployeeExperienceTrans.Admin'),
('Admin', 'EmployeeExperienceTrans.Create'),
('Employee', 'EmployeeExperienceTrans.EmployeeExperience'),
('Admin', 'EmployeeExperienceTrans.Update'),
('Admin', 'EmployeeExperienceTrans.View'),
('Employee', 'EmployeeExperienceTrans.View'),
('Admin', 'EmployeeInfo.Admin'),
('Employee', 'EmployeeInfo.Admin'),
('HR Section', 'EmployeeInfo.Admin'),
('Admin', 'EmployeeInfo.Create'),
('HR Section', 'EmployeeInfo.Create'),
('Admin', 'EmployeeInfo.Update'),
('HR Section', 'EmployeeInfo.Update'),
('Admin', 'EmployeeInfo.View'),
('Employee', 'EmployeeInfo.View'),
('HR Section', 'EmployeeInfo.View'),
('Accountant', 'EmployeeLeaveApplication.Leaveerror'),
('Admin', 'EmployeeLeaveApplication.Leaveerror'),
('Employee', 'EmployeeLeaveApplication.Leaveerror'),
('Accountant', 'Employeemodule'),
('Employee', 'Employeemodule'),
('HR Section', 'Employeemodule'),
('HR Section', 'EmployeePhotos.Admin'),
('HR Section', 'EmployeePhotos.Create'),
('HR Section', 'EmployeePhotos.Update'),
('HR Section', 'EmployeePhotos.View'),
('Admin', 'EmployeeSmsEmailDetails.Admin'),
('Accountant', 'EmployeeSmsEmailDetails.EmployeeBulkSmsEmail'),
('Admin', 'EmployeeSmsEmailDetails.View'),
('HOD', 'EmployeeTimetable.*'),
('Admin', 'EmployeeTimetable.Admin'),
('Employee', 'EmployeeTimetable.Admin'),
('Employee', 'EmployeeTimetable.View'),
('HOD', 'EmployeeTimetable.View'),
('Admin', 'EmployeeTransaction.*'),
('Accountant', 'EmployeeTransaction.Admin'),
('Admin', 'EmployeeTransaction.Admin'),
('Employee', 'EmployeeTransaction.Admin'),
('HR Section', 'EmployeeTransaction.Admin'),
('Admin', 'EmployeeTransaction.Create'),
('HR Section', 'EmployeeTransaction.Create'),
('Accountant', 'EmployeeTransaction.Final_view'),
('Admin', 'EmployeeTransaction.Final_view'),
('Employee', 'EmployeeTransaction.Final_view'),
('HR Section', 'EmployeeTransaction.Final_view'),
('Admin', 'EmployeeTransaction.Update'),
('Employee', 'EmployeeTransaction.Update'),
('HR Section', 'EmployeeTransaction.Update'),
('HR Section', 'EmployeeTransaction.UpdateEmployeeData'),
('Admin', 'Employee_attendence.Admin'),
('HR Section', 'Employee_attendence.Admin'),
('HR Section', 'Employee_attendence.attendence_import'),
('HR Section', 'Employee_attendence.Create'),
('HR Section', 'Employee_attendence.Employeeupdate'),
('Employee', 'Employee_attendence.emp_attendence'),
('HR Section', 'Employee_attendence.emp_attendence'),
('Employee', 'Employee_attendence.Singlemonthattendence'),
('HR Section', 'Employee_attendence.Update'),
('Admin', 'Employee_attendence.View'),
('HR Section', 'Employee_attendence.View'),
('Accountant', 'Exam.ExamSchedule.ErrorSchedule'),
('Accountant', 'ExportToPDFExcel.*'),
('HOD', 'ExportToPDFExcel.*'),
('HR Section', 'ExportToPDFExcel.*'),
('Student Section', 'ExportToPDFExcel.*'),
('Employee', 'ExtralecTimetable.Admin'),
('Employee', 'ExtralecTimetable.View'),
('Employee', 'FeedbackCategoryMaster.Admin'),
('Admin', 'FeedbackDetails.*'),
('Admin', 'FeedbackDetails.Admin'),
('Admin', 'FeedbackDetails.View'),
('Student', 'FeedbackDetailsTable.StudentPerformance'),
('Student Section', 'FeedbackDetailsTable.Update'),
('Admin', 'FeedbackMaster.*'),
('Admin', 'FeedbackMaster.Admin'),
('Admin', 'FeedbackMaster.Create'),
('Admin', 'FeedbackMaster.Update'),
('Admin', 'FeedbackMaster.View'),
('Accountant', 'Fees'),
('Accountant', 'FeesDetailsMaster.Admin'),
('Accountant', 'FeesDetailsMaster.Create'),
('Accountant', 'FeesDetailsMaster.Update'),
('Accountant', 'FeesDetailsMaster.View'),
('Admin', 'FeesDetailsTable.*'),
('Admin', 'FeesDetailsTable.Admin'),
('Admin', 'FeesDetailsTable.Create'),
('Admin', 'FeesDetailsTable.Update'),
('Admin', 'FeesDetailsTable.View'),
('Accountant', 'FeesMaster.*'),
('Admin', 'FeesMaster.*'),
('Accountant', 'FeesMaster.Admin'),
('Admin', 'FeesMaster.Admin'),
('Admin', 'FeesMaster.Create'),
('Accountant', 'FeesMaster.GenerateMultipleFees'),
('Admin', 'FeesMaster.Update'),
('Admin', 'FeesMaster.View'),
('Accountant', 'FeesMasterTransaction.*'),
('Admin', 'FeesMasterTransaction.*'),
('Admin', 'FeesMasterTransaction.Admin'),
('Admin', 'FeesMasterTransaction.Create'),
('Admin', 'FeesMasterTransaction.Update'),
('Admin', 'FeesMasterTransaction.View'),
('Admin', 'FeesPaymentCash.*'),
('Admin', 'FeesPaymentCash.Admin'),
('Admin', 'FeesPaymentCash.Create'),
('Admin', 'FeesPaymentCash.Update'),
('Admin', 'FeesPaymentCash.View'),
('Admin', 'FeesPaymentCheque.*'),
('Accountant', 'FeesPaymentCheque.Admin'),
('Admin', 'FeesPaymentCheque.Admin'),
('Accountant', 'FeesPaymentCheque.Cheque_result'),
('Admin', 'FeesPaymentCheque.Cheque_result'),
('Accountant', 'FeesPaymentCheque.Cheque_search'),
('Admin', 'FeesPaymentCheque.Cheque_search'),
('Admin', 'FeesPaymentCheque.Create'),
('Accountant', 'FeesPaymentCheque.my_update'),
('Admin', 'FeesPaymentCheque.my_update'),
('Admin', 'FeesPaymentCheque.Update'),
('Accountant', 'FeesPaymentCheque.View'),
('Admin', 'FeesPaymentCheque.View'),
('Admin', 'FeesPaymentMethod.*'),
('Admin', 'FeesPaymentMethod.Admin'),
('Admin', 'FeesPaymentMethod.Create'),
('Admin', 'FeesPaymentMethod.Update'),
('Admin', 'FeesPaymentMethod.View'),
('Admin', 'FeesPaymentTransaction.*'),
('Admin', 'FeesPaymentTransaction.Admin'),
('Accountant', 'FeesPaymentTransaction.Branch_receipt_generate_print'),
('Admin', 'FeesPaymentTransaction.Branch_receipt_generate_print'),
('Accountant', 'FeesPaymentTransaction.Create'),
('Admin', 'FeesPaymentTransaction.Create'),
('Accountant', 'FeesPaymentTransaction.date_report'),
('Admin', 'FeesPaymentTransaction.date_report'),
('Accountant', 'FeesPaymentTransaction.Delete'),
('Admin', 'FeesPaymentTransaction.Delete'),
('Accountant', 'FeesPaymentTransaction.Mis_report'),
('Admin', 'FeesPaymentTransaction.Mis_report'),
('Accountant', 'FeesPaymentTransaction.Paid'),
('Admin', 'FeesPaymentTransaction.Paid'),
('Accountant', 'FeesPaymentTransaction.Payfeescash'),
('Admin', 'FeesPaymentTransaction.Payfeescash'),
('Accountant', 'FeesPaymentTransaction.Payfeescheque'),
('Admin', 'FeesPaymentTransaction.Payfeescheque'),
('Accountant', 'FeesPaymentTransaction.Print_cash_receipt'),
('Admin', 'FeesPaymentTransaction.Print_cash_receipt'),
('Accountant', 'FeesPaymentTransaction.Print_cheque_receipt'),
('Admin', 'FeesPaymentTransaction.Print_cheque_receipt'),
('Accountant', 'FeesPaymentTransaction.Receipt_generate_print'),
('Admin', 'FeesPaymentTransaction.Receipt_generate_print'),
('Accountant', 'FeesPaymentTransaction.StudentFeesReport'),
('Student', 'FeesPaymentTransaction.StudentFeesReportwithoutform'),
('Accountant', 'FeesPaymentTransaction.Total'),
('Admin', 'FeesPaymentTransaction.Total'),
('Accountant', 'FeesPaymentTransaction.UnPaid'),
('Admin', 'FeesPaymentTransaction.UnPaid'),
('Admin', 'FeesPaymentTransaction.Update'),
('Accountant', 'FeesPaymentTransaction.Update_payfeescash'),
('Admin', 'FeesPaymentTransaction.Update_payfeescash'),
('Accountant', 'FeesPaymentTransaction.Update_payfeescheque'),
('Admin', 'FeesPaymentTransaction.Update_payfeescheque'),
('Admin', 'FeesPaymentTransaction.View'),
('Accountant', 'FeesPaymentType.*'),
('Admin', 'FeesPaymentType.*'),
('Accountant', 'FeesPaymentType.Admin'),
('Admin', 'FeesPaymentType.Admin'),
('Admin', 'FeesPaymentType.Create'),
('Admin', 'FeesPaymentType.Update'),
('Admin', 'FeesPaymentType.View'),
('Admin', 'FeesReceipt.*'),
('Admin', 'FeesReceipt.Admin'),
('Admin', 'FeesReceipt.Create'),
('Admin', 'FeesReceipt.View'),
('Admin', 'FeesTermsAndCondition.Admin'),
('Admin', 'FeesTermsAndCondition.Create'),
('Admin', 'FeesTermsAndCondition.Update'),
('Admin', 'FeesTermsAndCondition.View'),
('Admin', 'Givefeedback.Admin'),
('Admin', 'Givefeedback.View'),
('Admin', 'Gtunotice.Admin'),
('Employee', 'Gtunotice.Admin'),
('Admin', 'Gtunotice.Create'),
('Admin', 'Gtunotice.Update'),
('Admin', 'Gtunotice.View'),
('Employee', 'Gtunotice.View'),
('Admin', 'Holidays.*'),
('Admin', 'Holidays.Admin'),
('Employee', 'Holidays.Admin'),
('Admin', 'Holidays.Create'),
('Admin', 'Holidays.Update'),
('Admin', 'Holidays.View'),
('Employee', 'Holidays.View'),
('HOD', 'HRMS'),
('HR Section', 'HRMS'),
('HR Section', 'Hrms.AttendanceMachineMaster.*'),
('HR Section', 'Hrms.AttendanceMachineMaster.Admin'),
('HR Section', 'Hrms.AttendanceMachineMaster.Create'),
('HR Section', 'Hrms.AttendanceMachineMaster.Delete'),
('HR Section', 'Hrms.AttendanceMachineMaster.Index'),
('HR Section', 'Hrms.AttendanceMachineMaster.Update'),
('HR Section', 'Hrms.AttendanceMachineMaster.View'),
('Accountant', 'Hrms.Dependent.*'),
('Admin', 'Hrms.Dependent.*'),
('Employee', 'Hrms.Dependent.*'),
('HOD', 'Hrms.Dependent.*'),
('HR Section', 'Hrms.Dependent.*'),
('Student', 'Hrms.Dependent.*'),
('Student Section', 'Hrms.Dependent.*'),
('HR Section', 'Hrms.Dependent.AutoCompleteLookup'),
('Accountant', 'Hrms.Dependent.Getdayscount'),
('HR Section', 'Hrms.Dependent.Getdayscount'),
('HR Section', 'Hrms.Dependent.UpdatePercentOfValue'),
('HR Section', 'Hrms.Dependent.UpdatePercentOfValue1'),
('HR Section', 'Hrms.Dependent.UpdatePercentOfValue2'),
('HR Section', 'Hrms.Dependent.UpdatePercentOfValue3'),
('HR Section', 'Hrms.Dependent.View'),
('HR Section', 'Hrms.EmployeeLeaveApplication.*'),
('Employee', 'Hrms.EmployeeLeaveApplication.Admin'),
('HR Section', 'Hrms.EmployeeLeaveApplication.Admin'),
('Employee', 'Hrms.EmployeeLeaveApplication.Cancelleave'),
('HR Section', 'Hrms.EmployeeLeaveApplication.Cancelleave'),
('Employee', 'Hrms.EmployeeLeaveApplication.Create'),
('HR Section', 'Hrms.EmployeeLeaveApplication.Create'),
('HR Section', 'Hrms.EmployeeLeaveApplication.Delete'),
('HR Section', 'Hrms.EmployeeLeaveApplication.Employeelist'),
('HR Section', 'Hrms.EmployeeLeaveApplication.Index'),
('Employee', 'Hrms.EmployeeLeaveApplication.LeaveDataError'),
('HR Section', 'Hrms.EmployeeLeaveApplication.LeaveDataError'),
('Employee', 'Hrms.EmployeeLeaveApplication.Leaveempreport'),
('HR Section', 'Hrms.EmployeeLeaveApplication.Leaveempreport'),
('Employee', 'Hrms.EmployeeLeaveApplication.Leaveerror'),
('HR Section', 'Hrms.EmployeeLeaveApplication.Leaveerror'),
('Employee', 'Hrms.EmployeeLeaveApplication.Leavereport'),
('HR Section', 'Hrms.EmployeeLeaveApplication.Leavereport'),
('Employee', 'Hrms.EmployeeLeaveApplication.Monthwiseleave'),
('Employee', 'Hrms.EmployeeLeaveApplication.Noempleave'),
('HR Section', 'Hrms.EmployeeLeaveApplication.Noempleave'),
('HR Section', 'Hrms.EmployeeLeaveApplication.RejectLeave'),
('Employee', 'Hrms.EmployeeLeaveApplication.Reportingerrormsg'),
('HR Section', 'Hrms.EmployeeLeaveApplication.Reportingerrormsg'),
('Employee', 'Hrms.EmployeeLeaveApplication.Reportinglist'),
('HR Section', 'Hrms.EmployeeLeaveApplication.Reportinglist'),
('Employee', 'Hrms.EmployeeLeaveApplication.StatusDataError'),
('HR Section', 'Hrms.EmployeeLeaveApplication.StatusDataError'),
('Employee', 'Hrms.EmployeeLeaveApplication.Update'),
('HR Section', 'Hrms.EmployeeLeaveApplication.Update'),
('Employee', 'Hrms.EmployeeLeaveApplication.UpdateLeaveStatus'),
('HR Section', 'Hrms.EmployeeLeaveApplication.UpdateLeaveStatus'),
('Employee', 'Hrms.EmployeeLeaveApplication.View'),
('HR Section', 'Hrms.EmployeeLeaveApplication.View'),
('HR Section', 'Hrms.EmployeeLeaveMaster.*'),
('HR Section', 'Hrms.EmployeeLeaveMaster.Admin'),
('HR Section', 'Hrms.EmployeeLeaveMaster.AssignEmployeeLeave'),
('HR Section', 'Hrms.EmployeeLeaveMaster.Create'),
('HR Section', 'Hrms.EmployeeLeaveMaster.Delete'),
('HR Section', 'Hrms.EmployeeLeaveMaster.Headassign'),
('HR Section', 'Hrms.EmployeeLeaveMaster.Index'),
('HR Section', 'Hrms.EmployeeLeaveMaster.SingleEmployeeAssignment'),
('HR Section', 'Hrms.EmployeeLeaveMaster.Update'),
('HR Section', 'Hrms.EmployeeLeaveMaster.View'),
('HR Section', 'Hrms.EmployeeReportingTable.*'),
('HOD', 'Hrms.EmployeeReportingTable.Admin'),
('HR Section', 'Hrms.EmployeeReportingTable.Admin'),
('HR Section', 'Hrms.EmployeeReportingTable.Create'),
('HR Section', 'Hrms.EmployeeReportingTable.Delete'),
('HR Section', 'Hrms.EmployeeReportingTable.Departmentwiseemp'),
('HR Section', 'Hrms.EmployeeReportingTable.Index'),
('HR Section', 'Hrms.EmployeeReportingTable.ReportingAssignment'),
('HR Section', 'Hrms.EmployeeReportingTable.Update'),
('HOD', 'Hrms.EmployeeReportingTable.UpdateAssignment'),
('HR Section', 'Hrms.EmployeeReportingTable.UpdateAssignment'),
('HR Section', 'Hrms.EmployeeReportingTable.View'),
('HR Section', 'Hrms.EmployeeSalarySlip.*'),
('HR Section', 'Hrms.EmployeeSalarySlip.Admin'),
('HR Section', 'Hrms.EmployeeSalarySlip.Create'),
('HR Section', 'Hrms.EmployeeSalarySlip.Delete'),
('HR Section', 'Hrms.EmployeeSalarySlip.GenerateExcel'),
('HR Section', 'Hrms.EmployeeSalarySlip.GeneratePdf'),
('HR Section', 'Hrms.EmployeeSalarySlip.Index'),
('HR Section', 'Hrms.EmployeeSalarySlip.Oldmonthsalary'),
('HR Section', 'Hrms.EmployeeSalarySlip.Update'),
('HR Section', 'Hrms.EmployeeSalarySlip.View'),
('HR Section', 'Hrms.EmployeeSalaryStructure.*'),
('HR Section', 'Hrms.EmployeeSalaryStructure.Admin'),
('HR Section', 'Hrms.EmployeeSalaryStructure.AssignEmployeeSalary'),
('HR Section', 'Hrms.EmployeeSalaryStructure.Create'),
('HR Section', 'Hrms.EmployeeSalaryStructure.Delete'),
('HR Section', 'Hrms.EmployeeSalaryStructure.Employeelist'),
('Employee', 'Hrms.EmployeeSalaryStructure.Employeesalaryhead'),
('HR Section', 'Hrms.EmployeeSalaryStructure.Headassign'),
('HR Section', 'Hrms.EmployeeSalaryStructure.Headcreate'),
('HR Section', 'Hrms.EmployeeSalaryStructure.Index'),
('Employee', 'Hrms.EmployeeSalaryStructure.Mysalaryslip'),
('HR Section', 'Hrms.EmployeeSalaryStructure.Salaryslip'),
('HR Section', 'Hrms.EmployeeSalaryStructure.SingleEmployeeAssignment'),
('HR Section', 'Hrms.EmployeeSalaryStructure.Update'),
('HR Section', 'Hrms.EmployeeSalaryStructure.View'),
('HR Section', 'Hrms.Exporttoexcelpdf.*'),
('HR Section', 'Hrms.Exporttoexcelpdf.AttendanceMachineMasterExcel'),
('HR Section', 'Hrms.Exporttoexcelpdf.AttendanceMachineMasterPdf'),
('HR Section', 'Hrms.Exporttoexcelpdf.EmployeeLeaveMasterExcel'),
('HR Section', 'Hrms.Exporttoexcelpdf.EmployeeLeaveMasterPdf'),
('HR Section', 'Hrms.Exporttoexcelpdf.EmployeereportingExcel'),
('HR Section', 'Hrms.Exporttoexcelpdf.EmployeereportingPdf'),
('HR Section', 'Hrms.Exporttoexcelpdf.EmployeesalaryExcel'),
('HR Section', 'Hrms.Exporttoexcelpdf.EmployeesalaryPdf'),
('HR Section', 'Hrms.Exporttoexcelpdf.EmployeesalarySlipExcel'),
('HR Section', 'Hrms.Exporttoexcelpdf.EmployeesalarySlipPdf'),
('HR Section', 'Hrms.Exporttoexcelpdf.GenerateExcel'),
('HR Section', 'Hrms.Exporttoexcelpdf.GeneratePdf'),
('HR Section', 'Hrms.Exporttoexcelpdf.LeaveMasterExcel'),
('HR Section', 'Hrms.Exporttoexcelpdf.LeaveMasterPdf'),
('HR Section', 'Hrms.Exporttoexcelpdf.LeaveRuleMasterExcel'),
('HR Section', 'Hrms.Exporttoexcelpdf.LeaveRuleMasterPdf'),
('HR Section', 'Hrms.Exporttoexcelpdf.LeaveStatusMasterExcel'),
('HR Section', 'Hrms.Exporttoexcelpdf.NationalHolidaysExcel'),
('HR Section', 'Hrms.LeaveMaster.*'),
('HR Section', 'Hrms.LeaveMaster.Admin'),
('HR Section', 'Hrms.LeaveMaster.Create'),
('HR Section', 'Hrms.LeaveMaster.Delete'),
('HR Section', 'Hrms.LeaveMaster.Index'),
('HR Section', 'Hrms.LeaveMaster.Update'),
('HR Section', 'Hrms.LeaveMaster.View'),
('HR Section', 'Hrms.LeaveRuleMaster.*'),
('HR Section', 'Hrms.LeaveRuleMaster.Admin'),
('HR Section', 'Hrms.LeaveRuleMaster.Create'),
('HR Section', 'Hrms.LeaveRuleMaster.Delete'),
('HR Section', 'Hrms.LeaveRuleMaster.Index'),
('HR Section', 'Hrms.LeaveRuleMaster.Update'),
('HR Section', 'Hrms.LeaveRuleMaster.View'),
('HR Section', 'Hrms.LeaveStatusMaster.*'),
('HR Section', 'Hrms.LeaveStatusMaster.Admin'),
('HR Section', 'Hrms.LeaveStatusMaster.Create'),
('HR Section', 'Hrms.LeaveStatusMaster.Delete'),
('HR Section', 'Hrms.LeaveStatusMaster.Index'),
('HR Section', 'Hrms.LeaveStatusMaster.Update'),
('HR Section', 'Hrms.LeaveStatusMaster.View'),
('HR Section', 'Hrms.LeaveStructureDesignation.*'),
('HR Section', 'Hrms.LeaveStructureDesignation.Admin'),
('HR Section', 'Hrms.LeaveStructureDesignation.Create'),
('HR Section', 'Hrms.LeaveStructureDesignation.Delete'),
('HR Section', 'Hrms.LeaveStructureDesignation.Error'),
('HR Section', 'Hrms.LeaveStructureDesignation.Index'),
('HR Section', 'Hrms.LeaveStructureDesignation.Multipledesignation'),
('HR Section', 'Hrms.LeaveStructureDesignation.Selectdesignation'),
('HR Section', 'Hrms.LeaveStructureDesignation.Update'),
('HR Section', 'Hrms.LeaveStructureDesignation.View'),
('HR Section', 'Hrms.LeaveStructureDesignationDuration.Admin'),
('HR Section', 'Hrms.LeaveStructureDesignationDuration.Create'),
('HR Section', 'Hrms.LeaveStructureDesignationDuration.Delete'),
('HR Section', 'Hrms.LeaveStructureDesignationDuration.Index'),
('HR Section', 'Hrms.LeaveStructureDesignationDuration.Update'),
('HR Section', 'Hrms.LeaveStructureDesignationDuration.View'),
('HR Section', 'Hrms.LeaveTransaction.*'),
('HR Section', 'Hrms.LeaveTransaction.Admin'),
('HR Section', 'Hrms.LeaveTransaction.Create'),
('HR Section', 'Hrms.LeaveTransaction.Delete'),
('HR Section', 'Hrms.LeaveTransaction.Index'),
('HR Section', 'Hrms.LeaveTransaction.Update'),
('HR Section', 'Hrms.LeaveTransaction.View'),
('HR Section', 'Hrms.NationalHolidays.*'),
('HR Section', 'Hrms.NationalHolidays.Addholiday'),
('HR Section', 'Hrms.NationalHolidays.Admin'),
('HR Section', 'Hrms.NationalHolidays.Create'),
('HR Section', 'Hrms.NationalHolidays.Delete'),
('HR Section', 'Hrms.NationalHolidays.Index'),
('HR Section', 'Hrms.NationalHolidays.Update'),
('HR Section', 'Hrms.NationalHolidays.View'),
('HR Section', 'Hrms.ReportingLevelMaster.Admin'),
('HR Section', 'Hrms.ReportingLevelMaster.Create'),
('HR Section', 'Hrms.ReportingLevelMaster.Delete'),
('HR Section', 'Hrms.ReportingLevelMaster.Index'),
('HR Section', 'Hrms.ReportingLevelMaster.LevelChart'),
('HR Section', 'Hrms.ReportingLevelMaster.Update'),
('HR Section', 'Hrms.ReportingLevelMaster.View'),
('HR Section', 'Hrms.SalaryHeadMaster.Admin'),
('HR Section', 'Hrms.SalaryHeadMaster.Create'),
('HR Section', 'Hrms.SalaryHeadMaster.Delete'),
('HR Section', 'Hrms.SalaryHeadMaster.Index'),
('HR Section', 'Hrms.SalaryHeadMaster.Update'),
('HR Section', 'Hrms.SalaryHeadMaster.View'),
('HR Section', 'Hrms.SalaryStructureDesignation.Admin'),
('HR Section', 'Hrms.SalaryStructureDesignation.Create'),
('HR Section', 'Hrms.SalaryStructureDesignation.Delete'),
('HR Section', 'Hrms.SalaryStructureDesignation.Index'),
('HR Section', 'Hrms.SalaryStructureDesignation.Selectdesignation'),
('HR Section', 'Hrms.SalaryStructureDesignation.Update'),
('HR Section', 'Hrms.SalaryStructureDesignation.View'),
('HR Section', 'Hrms.SalaryStructureDesignationDuration.Admin'),
('HR Section', 'Hrms.SalaryStructureDesignationDuration.Create'),
('HR Section', 'Hrms.SalaryStructureDesignationDuration.Delete'),
('HR Section', 'Hrms.SalaryStructureDesignationDuration.Index'),
('HR Section', 'Hrms.SalaryStructureDesignationDuration.Update'),
('HR Section', 'Hrms.SalaryStructureDesignationDuration.View'),
('HR Section', 'Hrms.StudentLeaveApplication.Admin'),
('HR Section', 'Hrms.StudentLeaveApplication.Adminreportinglist'),
('HR Section', 'Hrms.StudentLeaveApplication.Create'),
('HR Section', 'Hrms.StudentLeaveApplication.Delete'),
('HR Section', 'Hrms.StudentLeaveApplication.Index'),
('HR Section', 'Hrms.StudentLeaveApplication.Update'),
('HR Section', 'Hrms.StudentLeaveApplication.UpdateLeaveStatus'),
('HR Section', 'Hrms.StudentLeaveApplication.View'),
('HR Section', 'Hrms.Weekoff.*'),
('HR Section', 'Hrms.Weekoff.Admin'),
('HR Section', 'Hrms.Weekoff.Create'),
('HR Section', 'Hrms.Weekoff.Delete'),
('HR Section', 'Hrms.Weekoff.Index'),
('HR Section', 'Hrms.Weekoff.Update'),
('HR Section', 'Hrms.Weekoff.View'),
('HR Section', 'Idcard'),
('Student Section', 'Idcard'),
('HR Section', 'IdcardFieldFormat.Admin'),
('Student Section', 'IdcardFieldFormat.Admin'),
('HR Section', 'IdcardFieldFormat.Create'),
('Student Section', 'IdcardFieldFormat.Create'),
('Student Section', 'IdcardFieldFormat.Delete'),
('HR Section', 'IdcardFieldFormat.EmployeeCardCreate'),
('HR Section', 'IdcardFieldFormat.View'),
('Admin', 'ImportantNotice.*'),
('Admin', 'ImportantNotice.Admin'),
('Employee', 'ImportantNotice.Admin'),
('Admin', 'ImportantNotice.Create'),
('Admin', 'ImportantNotice.Update'),
('Admin', 'ImportantNotice.View'),
('Employee', 'ImportantNotice.View'),
('Admin', 'Inward.*'),
('Admin', 'Inward.Admin'),
('Admin', 'Inward.Create'),
('Admin', 'Inward.New_view'),
('Admin', 'Inward.Update'),
('Admin', 'Inward.View'),
('Admin', 'InwardDetails.*'),
('Admin', 'InwardDetails.Admin'),
('Admin', 'InwardDetails.Create'),
('Admin', 'InwardDetails.Update'),
('Admin', 'InwardDetails.View'),
('Admin', 'ItemCategory.*'),
('Admin', 'ItemCategory.Admin'),
('Admin', 'ItemCategory.Create'),
('Admin', 'ItemCategory.Update'),
('Admin', 'ItemCategory.View'),
('Admin', 'Languages.*'),
('Admin', 'Languages.Admin'),
('Student Section', 'Languages.Admin'),
('Admin', 'Languages.View'),
('Student Section', 'Languages.View'),
('Admin', 'LanguagesKnown.*'),
('Student Section', 'LanguagesKnown.Admin'),
('Student Section', 'LanguagesKnown.View'),
('Admin', 'LecDuration.Admin'),
('Admin', 'LecDuration.Create'),
('Admin', 'LecDuration.Delete'),
('Admin', 'LecDuration.Index'),
('Admin', 'LecDuration.Update'),
('HOD', 'LecDuration.Update'),
('Admin', 'LecDuration.View'),
('Accountant', 'leftDetainedPassStudentTable.Admin'),
('Employee', 'leftDetainedPassStudentTable.Admin'),
('HR Section', 'leftDetainedPassStudentTable.Admin'),
('Student Section', 'leftDetainedPassStudentTable.Admin'),
('Accountant', 'leftDetainedPassStudentTable.leftClearStudent'),
('Employee', 'leftDetainedPassStudentTable.leftClearStudent'),
('HR Section', 'leftDetainedPassStudentTable.leftClearStudent'),
('Student Section', 'leftDetainedPassStudentTable.leftClearStudent'),
('Student Section', 'LeftDetainedPassStudentTable.Rejoin'),
('Student Section', 'leftDetainedPassStudentTable.update_status'),
('Admin', 'LoginUser.Admin'),
('Admin', 'LoginUser.View'),
('Admin', 'MessageOfDay.*'),
('Employee', 'MessageOfDay.*'),
('Employee', 'MessageOfDay.Admin'),
('Admin', 'MessageOfDay.Create'),
('Admin', 'MessageOfDay.Update'),
('Admin', 'MessageOfDay.View'),
('Accountant', 'MiscellaneousFeesMaster.*'),
('Admin', 'MiscellaneousFeesMaster.*'),
('Accountant', 'MiscellaneousFeesMaster.Admin'),
('Admin', 'MiscellaneousFeesMaster.Admin'),
('Admin', 'MiscellaneousFeesMaster.View'),
('Accountant', 'MiscellaneousFeesPaymentCash.*'),
('Admin', 'MiscellaneousFeesPaymentCash.*'),
('Admin', 'MiscellaneousFeesPaymentCash.Admin'),
('Admin', 'MiscellaneousFeesPaymentCash.View'),
('Accountant', 'MiscellaneousFeesPaymentCheque.*'),
('Admin', 'MiscellaneousFeesPaymentCheque.*'),
('Admin', 'MiscellaneousFeesPaymentCheque.Admin'),
('Admin', 'MiscellaneousFeesPaymentCheque.View'),
('Accountant', 'MiscellaneousFeesPaymentTransaction.*'),
('Admin', 'MiscellaneousFeesPaymentTransaction.*'),
('Admin', 'Nationality.*'),
('Admin', 'Nationality.Admin'),
('Student Section', 'Nationality.Admin'),
('Admin', 'Nationality.View'),
('Student Section', 'Nationality.View'),
('Admin', 'NoOfBreakTable.Admin'),
('HOD', 'NoOfBreakTable.Admin'),
('Admin', 'NoOfBreakTable.Create'),
('Admin', 'NoOfBreakTable.Delete'),
('Admin', 'NoOfBreakTable.Index'),
('Admin', 'NoOfBreakTable.Update'),
('Admin', 'NoOfBreakTable.View'),
('Employee', 'Notification.employeeNotification.Read'),
('Employee', 'Notification.globalNotification.Read'),
('Student', 'Notification.globalNotification.Read'),
('Student', 'Notification.studentNotification.Read'),
('Employee', 'Notifyii.EmployeeNotification.Read'),
('Employee', 'Notifyii.EmployeeNotification.View'),
('Employee', 'Notifyii.ModelNotifyii.View'),
('Student', 'Notifyii.ModelNotifyii.View'),
('Student', 'Notifyii.StudentNotification.Read'),
('Student', 'Notifyii.StudentNotification.View'),
('Admin', 'Organization.*'),
('Admin', 'Outward.*'),
('Admin', 'Outward.Admin'),
('Admin', 'Outward.Create'),
('Admin', 'Outward.New_view'),
('Admin', 'Outward.Update'),
('Admin', 'Outward.View'),
('Admin', 'OutwardDetails.*'),
('Admin', 'OutwardDetails.Admin'),
('Admin', 'OutwardDetails.Update'),
('Admin', 'OutwardDetails.View'),
('Employee', 'Photogallery'),
('Student', 'Photogallery'),
('Employee', 'PhotoGallery.*'),
('Student', 'PhotoGallery.*'),
('Employee', 'PhotoGallery.Admin'),
('Admin', 'Qualification.*'),
('Admin', 'Qualification.Admin'),
('Student Section', 'Qualification.Admin'),
('Student Section', 'Qualification.Create'),
('Student Section', 'Qualification.Update'),
('Admin', 'Qualification.View'),
('Student Section', 'Qualification.View'),
('Admin', 'Quota.*'),
('Admin', 'Quota.Admin'),
('Student Section', 'Quota.Admin'),
('Student Section', 'Quota.Create'),
('Student Section', 'Quota.Update'),
('Admin', 'Quota.View'),
('Student Section', 'Quota.View'),
('Admin', 'Religion.*'),
('Admin', 'Religion.Admin'),
('Student Section', 'Religion.Admin'),
('Admin', 'Religion.View'),
('Student Section', 'Religion.View'),
('HR Section', 'Report.Documentsearch'),
('HR Section', 'Report.Documentsearchview'),
('Student Section', 'Report.Documentsearchview'),
('HR Section', 'Report.Employeeid'),
('HR Section', 'Report.EmployeeInfoReport'),
('HR Section', 'Report.StudentDocumentsearch'),
('Student Section', 'Report.StudentDocumentsearch'),
('HR Section', 'Report.Studentdocumentsearchview'),
('Student Section', 'Report.Studentdocumentsearchview'),
('Accountant', 'Report.Studenthistory'),
('Employee', 'Report.Studenthistory'),
('HR Section', 'Report.Studenthistory'),
('Student', 'Report.Studenthistory'),
('Student Section', 'Report.Studenthistory'),
('HR Section', 'Report.Studentid'),
('Student Section', 'Report.Studentid'),
('Employee', 'Report.StudInfoReport'),
('HR Section', 'Report.StudInfoReport'),
('Employee', 'Reports'),
('HOD', 'Reports'),
('Admin', 'RoomCategory.Admin'),
('Admin', 'RoomCategory.View'),
('Admin', 'RoomDetailsMaster.Admin'),
('Admin', 'RoomDetailsMaster.View'),
('Admin', 'Shift.*'),
('Admin', 'Shift.Admin'),
('Student Section', 'Shift.Admin'),
('Admin', 'Shift.View'),
('Student Section', 'Shift.View'),
('Admin', 'Site.*'),
('Accountant', 'Smsemail'),
('Employee', 'Smsemail'),
('Admin', 'State.*'),
('Admin', 'State.Admin'),
('Student Section', 'State.Admin'),
('Admin', 'State.View'),
('Student Section', 'State.View'),
('Admin', 'StudentAcademicRecordTrans.*'),
('Student Section', 'StudentAcademicRecordTrans.Admin'),
('Student Section', 'StudentAcademicRecordTrans.Create'),
('Student', 'StudentAcademicRecordTrans.StudentAcademicRecords'),
('Student Section', 'StudentAcademicRecordTrans.Update'),
('Student Section', 'StudentAcademicRecordTrans.View'),
('Accountant', 'StudentArchiveTable.Admin'),
('HR Section', 'StudentArchiveTable.Admin'),
('Student Section', 'StudentArchiveTable.Admin'),
('Student Section', 'StudentCertificateDetailsTable.Admin'),
('Student', 'StudentCertificateDetailsTable.StudentCertificate'),
('Student Section', 'StudentCertificateDetailsTable.View'),
('Admin', 'StudentDocs.*'),
('Admin', 'StudentDocs.Admin'),
('Student Section', 'StudentDocs.Admin'),
('Admin', 'StudentDocs.Create'),
('Student Section', 'StudentDocs.Create'),
('Admin', 'StudentDocs.Update'),
('Student Section', 'StudentDocs.Update'),
('Admin', 'StudentDocs.View'),
('Student Section', 'StudentDocs.View'),
('Admin', 'StudentDocsTrans.*'),
('Admin', 'StudentDocsTrans.Admin'),
('Student Section', 'StudentDocsTrans.Admin'),
('Admin', 'StudentDocsTrans.Create'),
('Student Section', 'StudentDocsTrans.Create'),
('Student', 'StudentDocsTrans.StudentDocs'),
('Admin', 'StudentDocsTrans.Update'),
('Student Section', 'StudentDocsTrans.Update'),
('Admin', 'StudentDocsTrans.View'),
('Student Section', 'StudentDocsTrans.View'),
('Accountant', 'StudentFeesMaster.Addotherfees'),
('Accountant', 'StudentFeesMaster.Admin'),
('Accountant', 'StudentFeesMaster.AssignFeesStudent'),
('Accountant', 'StudentFeesMaster.Update'),
('Accountant', 'StudentFeesMaster.View'),
('Accountant', 'Studentmodule'),
('Employee', 'Studentmodule'),
('HOD', 'Studentmodule'),
('Student', 'Studentmodule'),
('Student Section', 'Studentmodule'),
('Student Section', 'StudentPhotos.Admin'),
('Student Section', 'StudentPhotos.Create'),
('Student Section', 'StudentPhotos.Update'),
('Student Section', 'StudentPhotos.View'),
('Admin', 'StudentSmsEmailDetails.Admin'),
('Employee', 'StudentSmsEmailDetails.Admin'),
('Accountant', 'StudentSmsEmailDetails.DoChacked'),
('Employee', 'StudentSmsEmailDetails.ScheduleAttendanceMessage'),
('Accountant', 'StudentSmsEmailDetails.ScheduleFeesMessage'),
('Accountant', 'StudentSmsEmailDetails.StudentBulkSmsEmail'),
('Admin', 'StudentSmsEmailDetails.View'),
('Student Section', 'Studentstatusmaster.Admin'),
('Student Section', 'Studentstatusmaster.Create'),
('Student Section', 'Studentstatusmaster.Update'),
('Student Section', 'Studentstatusmaster.View'),
('Admin', 'StudentTransaction.*'),
('Accountant', 'StudentTransaction.Admin'),
('Admin', 'StudentTransaction.Admin'),
('Employee', 'StudentTransaction.Admin'),
('HR Section', 'StudentTransaction.Admin'),
('Student Section', 'StudentTransaction.Admin'),
('Admin', 'StudentTransaction.Create'),
('Student Section', 'StudentTransaction.Create'),
('Accountant', 'StudentTransaction.Final_view'),
('Admin', 'StudentTransaction.Final_view'),
('Student', 'StudentTransaction.Final_view'),
('Student Section', 'StudentTransaction.Final_view'),
('Admin', 'StudentTransaction.Update'),
('Employee', 'StudentTransaction.Update'),
('Student', 'StudentTransaction.Update'),
('Student Section', 'StudentTransaction.Update'),
('Student Section', 'StudentTransaction.UpdateStudentData'),
('Admin', 'StudentTransaction.View'),
('Student Section', 'StudentTransaction.View'),
('Admin', 'SubjectExaminationMark.Admin'),
('Admin', 'SubjectExaminationMark.View'),
('Admin', 'SubjectGuidelines.Admin'),
('Admin', 'SubjectGuidelines.View'),
('Admin', 'SubjectMaster.*'),
('Admin', 'SubjectMaster.Admin'),
('Admin', 'SubjectMaster.View'),
('Admin', 'SubjectRefbook.Admin'),
('Admin', 'SubjectRefbook.View'),
('Admin', 'SubjectSyllabus.Admin'),
('Admin', 'SubjectSyllabus.View'),
('Admin', 'SubjectTeachingSchema.Admin'),
('Admin', 'SubjectTeachingSchema.View'),
('Admin', 'SubjectTextbook.Admin'),
('Admin', 'SubjectTextbook.View'),
('Admin', 'SubjectType.*'),
('Admin', 'SubjectType.Admin'),
('Admin', 'SubjectType.View'),
('HOD', 'Timetable'),
('Admin', 'TimeTable.Admin'),
('Employee', 'TimeTable.Admin'),
('HOD', 'TimeTable.Admin'),
('HOD', 'TimeTable.Branchfaculty'),
('Admin', 'TimeTable.BranchwiseReport'),
('HOD', 'TimeTable.BranchwiseReport'),
('Admin', 'TimeTable.Create'),
('Admin', 'TimeTable.CreateFinaltable'),
('Admin', 'TimeTable.Createtable'),
('Admin', 'TimeTable.Delete'),
('Admin', 'TimeTable.DeleteSubjectRecord'),
('HOD', 'TimeTable.DeleteSubjectRecord'),
('Admin', 'TimeTable.DeleteSubjectReport'),
('HOD', 'TimeTable.DeleteSubjectReport'),
('Admin', 'TimeTable.FacultyPersonalTimetable'),
('Employee', 'TimeTable.FacultyPersonalTimetable'),
('Employee', 'TimeTable.Facultytimetable'),
('Admin', 'TimeTable.FacultyTimetableReport'),
('Employee', 'TimeTable.FacultyTimetableReport'),
('HOD', 'TimeTable.FacultyTimetableReport'),
('Admin', 'TimeTable.Faculty_timetable_report'),
('HOD', 'TimeTable.Faculty_timetable_report'),
('HOD', 'TimeTable.Generatebranchwise'),
('Admin', 'TimeTable.MasterTableReport'),
('HOD', 'TimeTable.MasterTableReport'),
('Admin', 'TimeTable.RoomMasterReport'),
('HOD', 'TimeTable.RoomMasterReport'),
('Admin', 'TimeTable.RoomReport'),
('HOD', 'TimeTable.RoomReport'),
('Admin', 'TimeTable.StudentPersonalTimetable'),
('Student', 'TimeTable.StudentPersonalTimetable'),
('Student Section', 'TimeTable.StudentPersonalTimetable'),
('Student', 'TimeTable.Studenttimetable'),
('Student Section', 'TimeTable.Studenttimetable'),
('Admin', 'TimeTable.Update'),
('HOD', 'TimeTableDetail.Branchwisecreate'),
('Admin', 'TimeTableDetail.Create'),
('Admin', 'TimeTableDetail.Delete'),
('HOD', 'TimeTableDetail.Deletebranchwisesubject'),
('Admin', 'TimeTableDetail.Update'),
('HOD', 'TimeTableDetail.Updatebranchwise'),
('Employee', 'TimeTableDetail.View'),
('Admin', 'User.*'),
('Accountant', 'User.Change'),
('Admin', 'User.Change'),
('Employee', 'User.Change'),
('HOD', 'User.Change'),
('HR Section', 'User.Change'),
('Student', 'User.Change'),
('Student Section', 'User.Change'),
('Admin', 'VisitorPass.*'),
('Admin', 'VisitorPass.Admin'),
('Admin', 'VisitorPass.Create'),
('Admin', 'VisitorPass.myupdate'),
('Admin', 'VisitorPass.New_view'),
('Admin', 'VisitorPass.Total_visitors'),
('Admin', 'VisitorPass.Update'),
('Admin', 'Year.*'),
('Student Section', 'Year.Admin'),
('Student Section', 'Year.View');

-- --------------------------------------------------------

--
-- Table structure for table `bank_master`
--

CREATE TABLE IF NOT EXISTS `bank_master` (
  `bank_id` int(3) NOT NULL AUTO_INCREMENT,
  `bank_full_name` varchar(100) NOT NULL,
  `bank_short_name` varchar(15) NOT NULL,
  `bank_organization_id` int(2) NOT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
  `batch_id` int(2) NOT NULL AUTO_INCREMENT,
  `batch_name` varchar(60) NOT NULL,
  `batch_code` varchar(100) NOT NULL,
  `batch_organization_id` int(2) NOT NULL,
  `batch_created_by` int(3) NOT NULL,
  `batch_creation_date` datetime NOT NULL,
  `branch_id` int(3) NOT NULL,
  `div_id` int(3) NOT NULL,
  `subject_id` int(5) DEFAULT NULL,
  `academic_period_id` int(3) NOT NULL,
  `academic_name_id` int(3) NOT NULL,
  PRIMARY KEY (`batch_id`),
  KEY `fk_branch_id` (`branch_id`),
  KEY `fk_div_id` (`div_id`),
  KEY `fk_period_id` (`academic_period_id`),
  KEY `fk_acdm_name_id` (`academic_name_id`),
  KEY `fk_sub_id` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `block_user_table`
--

CREATE TABLE IF NOT EXISTS `block_user_table` (
  `block_user_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_table_user_id` int(5) NOT NULL,
  PRIMARY KEY (`block_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE IF NOT EXISTS `branch` (
  `branch_id` int(2) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `branch_organization_id` int(2) NOT NULL,
  `branch_created_by` int(3) NOT NULL,
  `branch_creation_date` date NOT NULL,
  `branch_alias` varchar(20) NOT NULL,
  `branch_code` int(5) NOT NULL,
  `branch_tag_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`branch_id`),
  KEY `fk_branch_tag` (`branch_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `branch_passoutsem_tag_table`
--

CREATE TABLE IF NOT EXISTS `branch_passoutsem_tag_table` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `branch_tag_name` varchar(20) NOT NULL,
  `pass_out_sem` int(5) NOT NULL,
  `created_by` int(5) NOT NULL,
  `creation_date` date NOT NULL,
  `organization_id` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(2) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(60) NOT NULL,
  `category_organization_id` int(2) NOT NULL,
  `category_created_by` int(3) NOT NULL,
  `category_created_date` datetime NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `city_id` int(30) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(30) NOT NULL,
  `state_id` int(30) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_page`
--

CREATE TABLE IF NOT EXISTS `dashboard_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `path` varchar(1000) DEFAULT NULL,
  `weight` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_portlet`
--

CREATE TABLE IF NOT EXISTS `dashboard_portlet` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dashboard` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned DEFAULT NULL,
  `settings` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(3) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(60) NOT NULL,
  `department_organization_id` int(2) NOT NULL,
  `department_created_by` int(2) NOT NULL,
  `department_created_date` datetime NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE IF NOT EXISTS `division` (
  `division_id` int(2) NOT NULL AUTO_INCREMENT,
  `division_name` varchar(60) NOT NULL,
  `division_code` varchar(100) NOT NULL,
  `division_organization_id` int(2) NOT NULL,
  `division_created_by` int(3) NOT NULL,
  `division_creation_date` datetime NOT NULL,
  `branch_id` int(3) NOT NULL,
  `academic_period_id` int(3) NOT NULL,
  `academic_name_id` int(3) NOT NULL,
  PRIMARY KEY (`division_id`),
  KEY `fk_branch_id` (`branch_id`),
  KEY `fk_academic_period_id` (`academic_period_id`),
  KEY `fk_academic_name_id` (`academic_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `document_category_master`
--

CREATE TABLE IF NOT EXISTS `document_category_master` (
  `doc_category_id` int(3) NOT NULL AUTO_INCREMENT,
  `doc_category_name` varchar(30) NOT NULL,
  `created_by` int(3) NOT NULL,
  `creation_date` date NOT NULL,
  `docs_category_organization_id` int(3) NOT NULL,
  PRIMARY KEY (`doc_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eduboard`
--

CREATE TABLE IF NOT EXISTS `eduboard` (
  `eduboard_id` int(2) NOT NULL AUTO_INCREMENT,
  `eduboard_name` varchar(30) NOT NULL,
  `eduboard_organization_id` int(2) NOT NULL,
  `eduboard_created_by` int(3) NOT NULL,
  `eduboard_created_date` datetime NOT NULL,
  `for_whom` int(2) NOT NULL,
  PRIMARY KEY (`eduboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_academic_record_trans`
--

CREATE TABLE IF NOT EXISTS `employee_academic_record_trans` (
  `employee_academic_record_trans_id` int(5) NOT NULL AUTO_INCREMENT,
  `employee_academic_record_trans_user_id` int(5) NOT NULL,
  `employee_academic_record_trans_qualification_id` int(5) NOT NULL,
  `employee_academic_record_trans_eduboard_id` int(5) NOT NULL,
  `employee_academic_record_trans_year_id` int(5) NOT NULL,
  `theory_mark_obtained` int(3) NOT NULL,
  `theory_mark_max` int(3) NOT NULL,
  `theory_percentage` float NOT NULL,
  `practical_mark_obtained` int(3) DEFAULT NULL,
  `practical_mark_max` int(3) DEFAULT NULL,
  `practical_percentage` float DEFAULT NULL,
  `employee_academic_record_trans_oraganization_id` int(3) NOT NULL,
  PRIMARY KEY (`employee_academic_record_trans_id`),
  KEY `fk_emp_qualification` (`employee_academic_record_trans_qualification_id`),
  KEY `fk_emp_eduboard` (`employee_academic_record_trans_eduboard_id`),
  KEY `fk_emp_year` (`employee_academic_record_trans_year_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_address`
--

CREATE TABLE IF NOT EXISTS `employee_address` (
  `employee_address_id` int(5) NOT NULL AUTO_INCREMENT,
  `employee_address_c_line1` varchar(100) DEFAULT NULL,
  `employee_address_c_line2` varchar(100) DEFAULT NULL,
  `employee_address_c_city` int(9) DEFAULT NULL,
  `employee_address_c_pincode` int(6) DEFAULT NULL,
  `employee_address_c_state` int(9) DEFAULT NULL,
  `employee_address_c_country` int(9) DEFAULT NULL,
  `employee_address_p_line1` varchar(100) DEFAULT NULL,
  `employee_address_p_line2` varchar(100) DEFAULT NULL,
  `employee_address_p_city` int(9) DEFAULT NULL,
  `employee_address_p_pincode` int(6) DEFAULT NULL,
  `employee_address_p_state` int(9) DEFAULT NULL,
  `employee_address_p_country` int(9) DEFAULT NULL,
  `employee_address_phone` bigint(15) DEFAULT NULL,
  `employee_address_mobile` bigint(15) DEFAULT NULL,
  `employee_address_c_taluka` varchar(50) DEFAULT NULL,
  `employee_address_c_district` varchar(50) DEFAULT NULL,
  `employee_address_p_taluka` varchar(50) DEFAULT NULL,
  `employee_address_p_district` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employee_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_designation`
--

CREATE TABLE IF NOT EXISTS `employee_designation` (
  `employee_designation_id` int(2) NOT NULL AUTO_INCREMENT,
  `employee_designation_name` varchar(25) NOT NULL,
  `employee_designation_level` int(5) NOT NULL,
  `employee_designation_organization_id` int(2) NOT NULL,
  `employee_designation_created_by` int(3) NOT NULL,
  `employee_designation_created_date` datetime NOT NULL,
  PRIMARY KEY (`employee_designation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_docs`
--

CREATE TABLE IF NOT EXISTS `employee_docs` (
  `employee_docs_id` int(5) NOT NULL AUTO_INCREMENT,
  `doc_category_id` int(3) NOT NULL,
  `title` varchar(100) NOT NULL,
  `employee_docs_desc` varchar(50) DEFAULT NULL,
  `employee_docs_path` varchar(150) NOT NULL,
  `employee_docs_submit_date` date NOT NULL,
  PRIMARY KEY (`employee_docs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_docs_trans`
--

CREATE TABLE IF NOT EXISTS `employee_docs_trans` (
  `employee_docs_trans_id` int(5) NOT NULL AUTO_INCREMENT,
  `employee_docs_trans_user_id` int(5) NOT NULL,
  `employee_docs_trans_emp_docs_id` int(5) NOT NULL,
  PRIMARY KEY (`employee_docs_trans_id`),
  KEY `fk_emp_docs_id` (`employee_docs_trans_emp_docs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_experience`
--

CREATE TABLE IF NOT EXISTS `employee_experience` (
  `employee_experience_id` int(5) NOT NULL AUTO_INCREMENT,
  `employee_experience_organization_name` varchar(50) NOT NULL,
  `employee_experience_designation` varchar(25) NOT NULL,
  `employee_experience_from` date NOT NULL,
  `employee_experience_to` date NOT NULL,
  `employee_experience` varchar(50) NOT NULL,
  PRIMARY KEY (`employee_experience_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_experience_trans`
--

CREATE TABLE IF NOT EXISTS `employee_experience_trans` (
  `employee_experience_trans_id` int(5) NOT NULL AUTO_INCREMENT,
  `employee_experience_trans_user_id` int(5) NOT NULL,
  `employee_experience_trans_emp_experience_id` int(5) NOT NULL,
  `employee_experience_trans_organization_id` int(3) NOT NULL,
  PRIMARY KEY (`employee_experience_trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_info`
--

CREATE TABLE IF NOT EXISTS `employee_info` (
  `employee_id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL,
  `employee_no` varchar(10) DEFAULT NULL,
  `employee_first_name` varchar(25) NOT NULL,
  `employee_middle_name` varchar(25) NOT NULL,
  `employee_last_name` varchar(25) NOT NULL,
  `employee_name_alias` varchar(25) DEFAULT NULL,
  `employee_mother_name` varchar(25) DEFAULT NULL,
  `employee_dob` date DEFAULT NULL,
  `employee_birthplace` varchar(25) DEFAULT NULL,
  `employee_gender` varchar(6) DEFAULT NULL,
  `employee_bloodgroup` varchar(3) DEFAULT NULL,
  `employee_marital_status` varchar(10) DEFAULT NULL,
  `employee_private_email` varchar(60) DEFAULT NULL,
  `employee_organization_mobile` bigint(15) DEFAULT NULL,
  `employee_private_mobile` bigint(15) NOT NULL,
  `employee_pancard_no` varchar(15) DEFAULT NULL,
  `employee_account_no` bigint(20) DEFAULT NULL,
  `employee_joining_date` date NOT NULL,
  `employee_probation_period` varchar(10) DEFAULT NULL,
  `employee_hobbies` text,
  `employee_technical_skills` text,
  `employee_project_details` text,
  `employee_curricular` text,
  `employee_reference` varchar(25) DEFAULT NULL,
  `employee_refer_designation` varchar(20) DEFAULT NULL,
  `employee_guardian_name` varchar(100) DEFAULT NULL,
  `employee_guardian_relation` varchar(20) DEFAULT NULL,
  `employee_guardian_home_address` varchar(100) DEFAULT NULL,
  `employee_guardian_qualification` varchar(50) DEFAULT NULL,
  `employee_guardian_occupation` varchar(50) DEFAULT NULL,
  `employee_guardian_income` varchar(15) DEFAULT NULL,
  `employee_guardian_occupation_address` varchar(100) DEFAULT NULL,
  `employee_guardian_occupation_city` int(4) DEFAULT NULL,
  `employee_guardian_city_pin` int(6) DEFAULT NULL,
  `employee_guardian_phone_no` bigint(15) DEFAULT NULL,
  `employee_guardian_mobile1` bigint(15) DEFAULT NULL,
  `employee_guardian_mobile2` bigint(15) DEFAULT NULL,
  `employee_faculty_of` varchar(50) DEFAULT NULL,
  `employee_attendance_card_id` varchar(15) NOT NULL,
  `employee_tally_id` varchar(9) DEFAULT NULL,
  `employee_created_by` bigint(20) DEFAULT NULL,
  `employee_creation_date` datetime DEFAULT NULL,
  `employee_type` int(3) NOT NULL,
  `employee_aicte_id` int(5) DEFAULT NULL,
  `employee_gtu_id` int(5) DEFAULT NULL,
  `employee_info_transaction_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_photos`
--

CREATE TABLE IF NOT EXISTS `employee_photos` (
  `employee_photos_id` int(5) NOT NULL AUTO_INCREMENT,
  `employee_photos_desc` varchar(50) DEFAULT NULL,
  `employee_photos_path` varchar(150) NOT NULL,
  PRIMARY KEY (`employee_photos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_transaction`
--

CREATE TABLE IF NOT EXISTS `employee_transaction` (
  `employee_transaction_id` int(9) NOT NULL AUTO_INCREMENT,
  `employee_transaction_user_id` int(5) NOT NULL,
  `employee_transaction_employee_id` int(5) NOT NULL,
  `employee_transaction_emp_address_id` int(5) DEFAULT NULL,
  `employee_transaction_branch_id` int(2) DEFAULT NULL,
  `employee_transaction_category_id` int(2) DEFAULT NULL,
  `employee_transaction_quota_id` int(2) DEFAULT NULL,
  `employee_transaction_religion_id` int(2) DEFAULT NULL,
  `employee_transaction_shift_id` int(5) NOT NULL,
  `employee_transaction_designation_id` int(2) NOT NULL,
  `employee_transaction_nationality_id` int(2) DEFAULT NULL,
  `employee_transaction_department_id` int(3) NOT NULL,
  `employee_transaction_organization_id` int(2) NOT NULL,
  `employee_transaction_languages_known_id` int(2) DEFAULT NULL,
  `employee_transaction_emp_photos_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`employee_transaction_id`),
  KEY `fk_branch` (`employee_transaction_branch_id`),
  KEY `fk_category` (`employee_transaction_category_id`),
  KEY `fk_quota` (`employee_transaction_quota_id`),
  KEY `fk_religion` (`employee_transaction_religion_id`),
  KEY `fk_shift` (`employee_transaction_shift_id`),
  KEY `fk_designation` (`employee_transaction_designation_id`),
  KEY `fk_nationality` (`employee_transaction_nationality_id`),
  KEY `fk_department` (`employee_transaction_department_id`),
  KEY `fk_organization` (`employee_transaction_organization_id`),
  KEY `fk_emp_info` (`employee_transaction_employee_id`),
  KEY `fk_emp_photo` (`employee_transaction_emp_photos_id`),
  KEY `employee_transaction_user_id` (`employee_transaction_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `feedback_category_master`
--

CREATE TABLE IF NOT EXISTS `feedback_category_master` (
  `feedback_category_master_id` int(5) NOT NULL AUTO_INCREMENT,
  `feedback_category_name` varchar(25) NOT NULL,
  `feedback_category_created_by` int(5) NOT NULL,
  `feedback_category_creation_date` date NOT NULL,
  `feedback_category_organizaton_id` int(5) NOT NULL,
  PRIMARY KEY (`feedback_category_master_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `feedback_details_table`
--

CREATE TABLE IF NOT EXISTS `feedback_details_table` (
  `feedback_details_table_id` int(5) NOT NULL AUTO_INCREMENT,
  `feedback_details_table_student_id` int(5) NOT NULL,
  `feedback_category_master_id` int(5) NOT NULL,
  `feedback_details_remarks` varchar(50) NOT NULL,
  `feedback_details_table_created_by` int(5) NOT NULL,
  `feedback_details_table_creation_date` date NOT NULL,
  PRIMARY KEY (`feedback_details_table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_details_master`
--

CREATE TABLE IF NOT EXISTS `fees_details_master` (
  `fees_details_master` int(3) NOT NULL AUTO_INCREMENT,
  `fees_details_master_name` varchar(30) NOT NULL,
  `created_by` int(3) NOT NULL,
  `creation_date` date NOT NULL,
  `organization_id` int(3) NOT NULL,
  PRIMARY KEY (`fees_details_master`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_details_table`
--

CREATE TABLE IF NOT EXISTS `fees_details_table` (
  `fees_details_id` int(3) NOT NULL AUTO_INCREMENT,
  `fees_details_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fees_details_amount` int(6) NOT NULL,
  `fees_details_created_by` int(5) NOT NULL,
  `fees_details_created_date` datetime NOT NULL,
  `fees_details_tally_id` int(6) DEFAULT NULL,
  PRIMARY KEY (`fees_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_master`
--

CREATE TABLE IF NOT EXISTS `fees_master` (
  `fees_master_id` int(9) NOT NULL AUTO_INCREMENT,
  `fees_master_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fees_master_created_by` int(5) NOT NULL,
  `fees_master_created_date` datetime NOT NULL,
  `fees_master_tally_id` int(6) DEFAULT NULL,
  `fees_organization_id` int(3) NOT NULL,
  `fees_branch_id` int(3) NOT NULL,
  `fees_academic_term_id` int(3) NOT NULL,
  `fees_academic_term_name_id` int(11) NOT NULL,
  `fees_quota_id` int(3) NOT NULL,
  `fees_master_total` int(7) NOT NULL,
  PRIMARY KEY (`fees_master_id`),
  KEY `fk_ORG_ID` (`fees_organization_id`),
  KEY `fk_BRANCH_ID` (`fees_branch_id`),
  KEY `fk_ACDM_ID` (`fees_academic_term_id`),
  KEY `fk_QUOTA_ID` (`fees_quota_id`),
  KEY `fk_term_name` (`fees_academic_term_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_master_transaction`
--

CREATE TABLE IF NOT EXISTS `fees_master_transaction` (
  `fees_id` int(11) NOT NULL AUTO_INCREMENT,
  `fees_master_id` int(11) NOT NULL,
  `fees_desc_id` int(11) NOT NULL,
  PRIMARY KEY (`fees_id`),
  KEY `fk_fees_details` (`fees_desc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_payment_cash`
--

CREATE TABLE IF NOT EXISTS `fees_payment_cash` (
  `fees_payment_cash_id` int(7) NOT NULL AUTO_INCREMENT,
  `fees_payment_cash_amount` int(7) NOT NULL,
  PRIMARY KEY (`fees_payment_cash_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_payment_cheque`
--

CREATE TABLE IF NOT EXISTS `fees_payment_cheque` (
  `fees_payment_cheque_id` int(6) NOT NULL AUTO_INCREMENT,
  `fees_payment_cheque_number` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `fees_payment_cheque_date` date NOT NULL,
  `fees_payment_cheque_bank` int(6) NOT NULL,
  `fees_payment_cheque_branch` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fees_payment_cheque_amount` int(6) NOT NULL,
  `fees_payment_cheque_status` tinyint(1) NOT NULL,
  `fees_payment_cheque_organization_id` int(3) NOT NULL,
  PRIMARY KEY (`fees_payment_cheque_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_payment_method`
--

CREATE TABLE IF NOT EXISTS `fees_payment_method` (
  `fees_payment_method_id` int(7) NOT NULL AUTO_INCREMENT,
  `fees_payment_method_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`fees_payment_method_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `fees_payment_method`
--

INSERT INTO `fees_payment_method` (`fees_payment_method_id`, `fees_payment_method_name`) VALUES
(1, 'Cash'),
(2, 'Cheque');

-- --------------------------------------------------------

--
-- Table structure for table `fees_payment_transaction`
--

CREATE TABLE IF NOT EXISTS `fees_payment_transaction` (
  `fees_payment_transaction_id` int(7) NOT NULL AUTO_INCREMENT,
  `fees_payment_master_id` int(3) NOT NULL,
  `fees_payment_method_id` int(7) NOT NULL,
  `fees_payment_cash_cheque_id` int(6) NOT NULL,
  `fees_receipt_id` int(7) NOT NULL,
  `fees_payment` int(6) NOT NULL,
  `fees_received_user_id` int(7) NOT NULL,
  `fees_full_part_payment_id` int(7) NOT NULL,
  `fees_student_id` int(9) NOT NULL,
  `fees_academic_period_id` int(3) NOT NULL,
  `fees_academic_term_id` int(3) NOT NULL,
  `fees_received_date` date NOT NULL,
  `fees_payment_transaction_organization_id` int(3) NOT NULL,
  `fees_payment_transaction_tally_id` int(3) NOT NULL,
  `fees_payment_transaction_tally_creation_date` date NOT NULL,
  PRIMARY KEY (`fees_payment_transaction_id`),
  KEY `fk_fees_pay_method` (`fees_payment_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_payment_type`
--

CREATE TABLE IF NOT EXISTS `fees_payment_type` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `fees_type_name` varchar(25) NOT NULL,
  `fees_payment_type_organization_id` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_receipt`
--

CREATE TABLE IF NOT EXISTS `fees_receipt` (
  `fees_receipt_id` int(7) NOT NULL AUTO_INCREMENT,
  `fees_receipt_number` int(7) DEFAULT NULL,
  `fees_receipt_org_id` int(3) NOT NULL,
  PRIMARY KEY (`fees_receipt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_terms_and_condition`
--

CREATE TABLE IF NOT EXISTS `fees_terms_and_condition` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `term` varchar(200) NOT NULL,
  `created_by` int(3) NOT NULL,
  `creation_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gtunotice`
--

CREATE TABLE IF NOT EXISTS `gtunotice` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `Description` varchar(300) NOT NULL,
  `Link` varchar(200) NOT NULL,
  `Created_By` varchar(30) NOT NULL,
  `Created_date` date NOT NULL,
  `gtunotice_organization_id` int(3) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `important_notice`
--

CREATE TABLE IF NOT EXISTS `important_notice` (
  `notice_id` int(3) NOT NULL AUTO_INCREMENT,
  `notice` varchar(200) NOT NULL,
  `created_by` int(2) NOT NULL,
  `creation_date` datetime NOT NULL,
  `notice_organization_id` int(3) NOT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE IF NOT EXISTS `item_category` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `languages_id` int(2) NOT NULL AUTO_INCREMENT,
  `languages_name` varchar(30) NOT NULL,
  `languages_organization_id` int(2) NOT NULL,
  `languages_created_by` int(3) NOT NULL,
  `languages_created_date` datetime NOT NULL,
  PRIMARY KEY (`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `languages_known`
--

CREATE TABLE IF NOT EXISTS `languages_known` (
  `languages_known_id` int(2) NOT NULL AUTO_INCREMENT,
  `languages_known1` int(2) DEFAULT NULL,
  `languages_known2` int(2) DEFAULT NULL,
  `languages_known3` int(2) DEFAULT NULL,
  `languages_known4` int(2) DEFAULT NULL,
  PRIMARY KEY (`languages_known_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `left_detained_pass_student_table`
--

CREATE TABLE IF NOT EXISTS `left_detained_pass_student_table` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `student_id` int(5) NOT NULL,
  `status_id` int(5) NOT NULL,
  `left_detained_shift_id` int(5) DEFAULT NULL,
  `sem` int(5) NOT NULL,
  `academic_term_period_id` int(5) NOT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `creation_date` date NOT NULL,
  `created_by` int(5) NOT NULL,
  `oraganization_id` int(5) NOT NULL,
  `left_detained_pass_student_cancel_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_left_student_id` (`student_id`),
  KEY `fk_status_id` (`status_id`),
  KEY `fk_sem_id` (`sem`),
  KEY `fk_academic_term_period_id` (`academic_term_period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `login_user`
--

CREATE TABLE IF NOT EXISTS `login_user` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `user_id` int(3) NOT NULL,
  `status` int(1) NOT NULL,
  `log_in_time` datetime NOT NULL,
  `log_out_time` datetime DEFAULT NULL,
  `user_ip_address` varchar(16) NOT NULL,
  `login_organization_id` int(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `message_of_day`
--

CREATE TABLE IF NOT EXISTS `message_of_day` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `message` varchar(250) NOT NULL,
  `created_by` int(7) NOT NULL,
  `creation_date` datetime NOT NULL,
  `message_of_day_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `miscellaneous_fees_master`
--

CREATE TABLE IF NOT EXISTS `miscellaneous_fees_master` (
  `miscellaneous_fees_id` int(11) NOT NULL AUTO_INCREMENT,
  `miscellaneous_fees_name` varchar(50) NOT NULL,
  `created_by` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `miscellaneous_organization_id` int(3) NOT NULL,
  PRIMARY KEY (`miscellaneous_fees_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `miscellaneous_fees_payment_cash`
--

CREATE TABLE IF NOT EXISTS `miscellaneous_fees_payment_cash` (
  `miscellaneous_fees_payment_cash_id` int(7) NOT NULL AUTO_INCREMENT,
  `miscellaneous_fees_payment_cash_master_id` int(3) NOT NULL,
  `miscellaneous_fees_payment_cash_amount` int(7) NOT NULL,
  `miscellaneous_fees_payment_cash_student_id` int(7) NOT NULL,
  `miscellaneous_fees_payment_cash_receipt_id` int(7) NOT NULL,
  `miscellaneous_fees_payment_cash_created_by` int(3) NOT NULL,
  `miscellaneous_fees_payment_cash_creation_date` datetime NOT NULL,
  `miscellaneous_fees_payment_organization_id` int(3) NOT NULL,
  PRIMARY KEY (`miscellaneous_fees_payment_cash_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `miscellaneous_fees_payment_cheque`
--

CREATE TABLE IF NOT EXISTS `miscellaneous_fees_payment_cheque` (
  `miscellaneous_fees_payment_cheque_id` int(6) NOT NULL AUTO_INCREMENT,
  `miscellaneous_fees_payment_cheque_master_id` int(3) NOT NULL,
  `miscellaneous_fees_payment_cheque_number` int(6) NOT NULL,
  `miscellaneous_fees_payment_cheque_date` datetime NOT NULL,
  `miscellaneous_fees_payment_cheque_bank` int(6) NOT NULL,
  `miscellaneous_fees_payment_cheque_branch` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `miscellaneous_fees_payment_cheque_amount` int(6) NOT NULL,
  `miscellaneous_fees_payment_cheque_status` tinyint(1) NOT NULL,
  `miscellaneous_fees_payment_cheque_draft_status` int(3) NOT NULL,
  `miscellaneous_fees_payment_cheque_student_id` int(7) NOT NULL,
  `miscellaneous_fees_payment_cheque_receipt_id` int(7) NOT NULL,
  `miscellaneous_fees_payment_cheque_created_by` int(3) NOT NULL,
  `miscellaneous_fees_payment_cheque_creation_date` datetime NOT NULL,
  `miscellaneous_fees_payment_cheque_organization_id` int(3) NOT NULL,
  PRIMARY KEY (`miscellaneous_fees_payment_cheque_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `miscellaneous_fees_payment_transaction`
--

CREATE TABLE IF NOT EXISTS `miscellaneous_fees_payment_transaction` (
  `miscellaneous_trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `miscellaneous_fees_id` int(11) NOT NULL,
  `student_fees_id` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `miscellaneous_fees_payment_transaction_organization_id` int(3) NOT NULL,
  PRIMARY KEY (`miscellaneous_trans_id`),
  KEY `fk_misce_id` (`miscellaneous_fees_id`),
  KEY `fk_stud_trans_id` (`student_fees_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `miscellaneous_fees_receipt`
--

CREATE TABLE IF NOT EXISTS `miscellaneous_fees_receipt` (
  `miscellaneous_fees_receipt_id` int(7) NOT NULL AUTO_INCREMENT,
  `miscellaneous_fees_receipt_number` int(7) NOT NULL,
  `miscellaneous_fees_receipt_org_id` int(3) NOT NULL,
  PRIMARY KEY (`miscellaneous_fees_receipt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nationality`
--

CREATE TABLE IF NOT EXISTS `nationality` (
  `nationality_id` int(2) NOT NULL AUTO_INCREMENT,
  `nationality_name` varchar(30) NOT NULL,
  `nationality_organization_id` int(2) NOT NULL,
  `nationality_created_by` int(3) NOT NULL,
  `nationality_created_date` datetime NOT NULL,
  PRIMARY KEY (`nationality_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE IF NOT EXISTS `organization` (
  `organization_id` int(2) NOT NULL AUTO_INCREMENT,
  `organization_name` varchar(50) NOT NULL,
  `organization_created_by` int(3) NOT NULL,
  `organization_creation_date` datetime NOT NULL,
  `address_line1` varchar(50) NOT NULL,
  `address_line2` varchar(50) NOT NULL,
  `city` int(3) NOT NULL,
  `state` int(3) NOT NULL,
  `country` int(3) NOT NULL,
  `pin` int(6) NOT NULL,
  `phone` bigint(15) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `fax_no` varchar(10) DEFAULT NULL,
  `logo` longblob NOT NULL,
  `file_type` varchar(30) NOT NULL,
  `no_of_semester` int(3) NOT NULL,
  PRIMARY KEY (`organization_id`),
  KEY `fk_org_city` (`city`),
  KEY `fk_org_state` (`state`),
  KEY `fk_org_country` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `photo_gallery`
--

CREATE TABLE IF NOT EXISTS `photo_gallery` (
  `photo_id` int(5) NOT NULL AUTO_INCREMENT,
  `photo_path` varchar(50) NOT NULL,
  `photo_desc` varchar(50) DEFAULT NULL,
  `created_by` int(3) NOT NULL,
  `creation_date` date NOT NULL,
  `photo_gallery_org_id` int(3) NOT NULL,
  PRIMARY KEY (`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `qualification`
--

CREATE TABLE IF NOT EXISTS `qualification` (
  `qualification_id` int(2) NOT NULL AUTO_INCREMENT,
  `qualification_name` varchar(30) NOT NULL,
  `qualification_organization_id` int(2) NOT NULL,
  `qualification_created_by` int(3) NOT NULL,
  `qualification_created_date` datetime NOT NULL,
  PRIMARY KEY (`qualification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `quota`
--

CREATE TABLE IF NOT EXISTS `quota` (
  `quota_id` int(2) NOT NULL AUTO_INCREMENT,
  `quota_name` varchar(30) NOT NULL,
  `quota_organization_id` int(2) NOT NULL,
  `quota_created_by` int(3) NOT NULL,
  `quota_created_date` datetime NOT NULL,
  PRIMARY KEY (`quota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `register_id` int(3) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `country_code` int(3) NOT NULL,
  `mobile` int(10) NOT NULL,
  PRIMARY KEY (`register_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `religion`
--

CREATE TABLE IF NOT EXISTS `religion` (
  `religion_id` int(2) NOT NULL AUTO_INCREMENT,
  `religion_name` varchar(30) NOT NULL,
  `religion_organization_id` int(2) NOT NULL,
  `religion_created_by` int(3) NOT NULL,
  `religion_created_date` datetime NOT NULL,
  PRIMARY KEY (`religion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Rights`
--

CREATE TABLE IF NOT EXISTS `Rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE IF NOT EXISTS `shift` (
  `shift_id` int(5) NOT NULL AUTO_INCREMENT,
  `shift_type` varchar(15) NOT NULL,
  `shift_organization_id` int(2) NOT NULL,
  `shift_start_time` time NOT NULL,
  `shift_end_time` time NOT NULL,
  `shift_created_by` int(3) NOT NULL,
  `shift_created_date` datetime NOT NULL,
  PRIMARY KEY (`shift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `state_id` int(30) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_academic_record_trans`
--

CREATE TABLE IF NOT EXISTS `student_academic_record_trans` (
  `student_academic_record_trans_id` int(5) NOT NULL AUTO_INCREMENT,
  `student_academic_record_trans_stud_id` int(5) NOT NULL,
  `student_academic_record_trans_qualification_id` int(3) NOT NULL,
  `student_academic_record_trans_eduboard_id` int(3) NOT NULL,
  `student_academic_record_trans_record_trans_year_id` int(5) NOT NULL,
  `theory_mark_obtained` int(3) NOT NULL,
  `theory_mark_max` int(3) NOT NULL,
  `theory_percentage` float NOT NULL,
  `practical_mark_obtained` int(3) DEFAULT NULL,
  `practical_mark_max` int(3) DEFAULT NULL,
  `practical_percentage` float DEFAULT NULL,
  PRIMARY KEY (`student_academic_record_trans_id`),
  KEY `fk_qualification` (`student_academic_record_trans_qualification_id`),
  KEY `fk_eduboard` (`student_academic_record_trans_eduboard_id`),
  KEY `fk_year` (`student_academic_record_trans_record_trans_year_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_address`
--

CREATE TABLE IF NOT EXISTS `student_address` (
  `student_address_id` int(5) NOT NULL AUTO_INCREMENT,
  `student_address_c_line1` varchar(100) DEFAULT NULL,
  `student_address_c_line2` varchar(100) DEFAULT NULL,
  `student_address_c_taluka` varchar(50) DEFAULT NULL,
  `student_address_c_district` varchar(50) DEFAULT NULL,
  `student_address_c_country` int(9) DEFAULT NULL,
  `student_address_c_city` int(9) DEFAULT NULL,
  `student_address_c_pin` int(6) DEFAULT NULL,
  `student_address_c_state` int(9) DEFAULT NULL,
  `student_address_p_line1` varchar(100) DEFAULT NULL,
  `student_address_p_line2` varchar(100) DEFAULT NULL,
  `student_address_p_taluka` varchar(50) DEFAULT NULL,
  `student_address_p_district` varchar(50) DEFAULT NULL,
  `student_address_p_city` int(9) DEFAULT NULL,
  `student_address_p_pin` int(6) DEFAULT NULL,
  `student_address_p_state` int(9) DEFAULT NULL,
  `student_address_p_country` int(9) DEFAULT NULL,
  `student_address_phone` bigint(15) DEFAULT NULL,
  `student_address_mobile` bigint(15) DEFAULT NULL,
  PRIMARY KEY (`student_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_archive_table`
--

CREATE TABLE IF NOT EXISTS `student_archive_table` (
  `student_archive_id` int(9) NOT NULL AUTO_INCREMENT,
  `student_archive_stud_tran_id` int(9) NOT NULL,
  `student_archive_branch_id` int(5) NOT NULL,
  `student_archive_stud_id` int(9) NOT NULL,
  `student_archive_ac_t_p_id` int(3) NOT NULL,
  `student_archive_ac_t_n_id` int(3) NOT NULL,
  `student_archive_status` int(3) NOT NULL,
  `student_archive_created_by` int(3) NOT NULL,
  `student_archive_creation_date` datetime NOT NULL,
  PRIMARY KEY (`student_archive_id`),
  KEY `student_archive_stud_tran_id` (`student_archive_stud_tran_id`),
  KEY `student_archive_stud_id` (`student_archive_stud_id`),
  KEY `student_archive_ac_t_p_id` (`student_archive_ac_t_p_id`),
  KEY `student_archive_ac_t_n_id` (`student_archive_ac_t_n_id`),
  KEY `student_archive_status` (`student_archive_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_docs`
--

CREATE TABLE IF NOT EXISTS `student_docs` (
  `student_docs_id` int(6) NOT NULL AUTO_INCREMENT,
  `doc_category_id` int(3) NOT NULL,
  `title` varchar(100) NOT NULL,
  `student_docs_desc` varchar(50) DEFAULT NULL,
  `student_docs_path` varchar(150) NOT NULL,
  `student_docs_submit_date` date NOT NULL,
  PRIMARY KEY (`student_docs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_docs_trans`
--

CREATE TABLE IF NOT EXISTS `student_docs_trans` (
  `student_docs_trans_id` int(5) NOT NULL AUTO_INCREMENT,
  `student_docs_trans_user_id` int(7) NOT NULL,
  `student_docs_trans_stud_docs_id` int(6) NOT NULL,
  PRIMARY KEY (`student_docs_trans_id`),
  KEY `fk_student_docs_id` (`student_docs_trans_stud_docs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_fees_master`
--

CREATE TABLE IF NOT EXISTS `student_fees_master` (
  `student_fees_master_id` int(5) NOT NULL AUTO_INCREMENT,
  `student_fees_master_student_transaction_id` int(5) NOT NULL,
  `fees_master_table_id` int(5) NOT NULL,
  `student_fees_master_details_id` int(5) NOT NULL,
  `fees_details_amount` int(5) NOT NULL,
  `student_fees_master_org_id` int(5) NOT NULL,
  `student_fees_master_created_by` int(5) NOT NULL,
  `student_fees_master_creation_date` date NOT NULL,
  PRIMARY KEY (`student_fees_master_id`),
  KEY `fk_feesmaster` (`fees_master_table_id`),
  KEY `fk_fees_detail` (`student_fees_master_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE IF NOT EXISTS `student_info` (
  `student_id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL,
  `student_roll_no` varchar(15) NOT NULL,
  `student_merit_no` varchar(15) DEFAULT NULL,
  `student_enroll_no` varchar(15) NOT NULL,
  `student_gr_no` bigint(15) DEFAULT NULL,
  `student_first_name` varchar(25) NOT NULL,
  `student_middle_name` varchar(25) NOT NULL,
  `student_last_name` varchar(25) NOT NULL,
  `student_father_name` varchar(25) DEFAULT NULL,
  `student_mother_name` varchar(25) DEFAULT NULL,
  `student_living_status` varchar(15) DEFAULT NULL,
  `student_adm_date` date DEFAULT NULL,
  `student_dob` date DEFAULT NULL,
  `student_birthplace` varchar(25) DEFAULT NULL,
  `student_gender` varchar(6) DEFAULT NULL,
  `student_guardian_name` varchar(100) DEFAULT NULL,
  `student_guardian_relation` varchar(20) DEFAULT NULL,
  `student_guardian_qualification` varchar(50) DEFAULT NULL,
  `student_guardian_occupation` varchar(50) DEFAULT NULL,
  `student_guardian_income` varchar(15) DEFAULT NULL,
  `student_guardian_occupation_address` varchar(100) DEFAULT NULL,
  `student_guardian_occupation_city` int(4) DEFAULT NULL,
  `student_guardian_city_pin` int(6) DEFAULT NULL,
  `student_guardian_home_address` varchar(100) DEFAULT NULL,
  `student_guardian_phoneno` bigint(15) DEFAULT NULL,
  `student_guardian_mobile` bigint(15) DEFAULT NULL,
  `student_email_id_1` varchar(60) NOT NULL,
  `student_email_id_2` varchar(60) DEFAULT NULL,
  `student_bloodgroup` varchar(3) DEFAULT NULL,
  `student_tally_ledger_name` varchar(30) DEFAULT NULL,
  `student_created_by` int(1) DEFAULT NULL,
  `student_creation_date` datetime DEFAULT NULL,
  `student_mobile_no` bigint(15) NOT NULL,
  `student_dtod_regular_status` varchar(20) NOT NULL,
  `student_info_transaction_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_photos`
--

CREATE TABLE IF NOT EXISTS `student_photos` (
  `student_photos_id` int(5) NOT NULL AUTO_INCREMENT,
  `student_photos_desc` varchar(50) DEFAULT NULL,
  `student_photos_path` varchar(150) NOT NULL,
  PRIMARY KEY (`student_photos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_status_master`
--

CREATE TABLE IF NOT EXISTS `student_status_master` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(30) NOT NULL,
  `student_status_master_detain_shift_id` int(5) DEFAULT NULL,
  `creation_date` date NOT NULL,
  `created_by` int(5) NOT NULL,
  `organization_id` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `student_status_master`
--

INSERT INTO `student_status_master` (`id`, `status_name`, `student_status_master_detain_shift_id`, `creation_date`, `created_by`, `organization_id`) VALUES
(1, 'Left Student', NULL, '0000-00-00', 0, 0),
(2, 'Detained', NULL, '0000-00-00', 0, 0),
(3, 'Regular', NULL, '0000-00-00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_transaction`
--

CREATE TABLE IF NOT EXISTS `student_transaction` (
  `student_transaction_id` int(9) NOT NULL AUTO_INCREMENT,
  `student_transaction_user_id` int(5) NOT NULL,
  `student_transaction_student_id` int(5) NOT NULL,
  `student_transaction_detain_student_flag` int(5) DEFAULT NULL,
  `student_transaction_branch_id` int(2) NOT NULL,
  `student_transaction_category_id` int(2) DEFAULT NULL,
  `student_transaction_organization_id` int(2) NOT NULL,
  `student_transaction_student_address_id` int(5) DEFAULT NULL,
  `student_transaction_nationality_id` int(2) DEFAULT NULL,
  `student_transaction_quota_id` int(2) NOT NULL,
  `student_transaction_religion_id` int(2) DEFAULT NULL,
  `student_transaction_shift_id` int(2) NOT NULL,
  `student_transaction_languages_known_id` int(2) DEFAULT NULL,
  `student_transaction_student_photos_id` int(5) NOT NULL,
  `student_transaction_division_id` int(2) DEFAULT NULL,
  `student_transaction_batch_id` int(2) DEFAULT NULL,
  `student_academic_term_period_tran_id` int(2) NOT NULL,
  `student_academic_term_name_id` int(11) NOT NULL,
  PRIMARY KEY (`student_transaction_id`),
  KEY `FK_trans_branch` (`student_transaction_branch_id`),
  KEY `fk_category` (`student_transaction_category_id`),
  KEY `fk_organization` (`student_transaction_organization_id`),
  KEY `fk_nationality` (`student_transaction_nationality_id`),
  KEY `fk_quota` (`student_transaction_quota_id`),
  KEY `fk_religion` (`student_transaction_religion_id`),
  KEY `fk_shift` (`student_transaction_shift_id`),
  KEY `fk_division` (`student_transaction_division_id`),
  KEY `fk_batch` (`student_transaction_batch_id`),
  KEY `FK_student_id` (`student_transaction_student_id`),
  KEY `fk_std_photo` (`student_transaction_student_photos_id`),
  KEY `fk_std_term_period_id` (`student_academic_term_period_tran_id`),
  KEY `fk_std_term_name_id` (`student_academic_term_name_id`),
  KEY `fk_lan_id` (`student_transaction_languages_known_id`),
  KEY `student_transaction_user_id` (`student_transaction_user_id`),
  KEY `student_transaction_detain_student_flag` (`student_transaction_detain_student_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mailbox_conversation`
--

CREATE TABLE IF NOT EXISTS `tbl_mailbox_conversation` (
  `conversation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `initiator_id` int(10) NOT NULL,
  `interlocutor_id` int(10) NOT NULL,
  `subject` varchar(100) NOT NULL DEFAULT '',
  `bm_read` tinyint(3) NOT NULL DEFAULT '0',
  `bm_deleted` tinyint(3) NOT NULL DEFAULT '0',
  `modified` int(10) unsigned NOT NULL,
  `is_system` enum('yes','no') NOT NULL DEFAULT 'no',
  `initiator_del` tinyint(1) unsigned DEFAULT '0',
  `interlocutor_del` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`conversation_id`),
  KEY `initiator_id` (`initiator_id`),
  KEY `interlocutor_id` (`interlocutor_id`),
  KEY `conversation_ts` (`modified`),
  KEY `subject` (`subject`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mailbox_message`
--

CREATE TABLE IF NOT EXISTS `tbl_mailbox_message` (
  `message_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int(10) unsigned NOT NULL,
  `created` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `text` mediumtext NOT NULL,
  `crc64` bigint(20) NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `sender_profile_id` (`sender_id`),
  KEY `recipient_profile_id` (`recipient_id`),
  KEY `conversation_id` (`conversation_id`),
  KEY `timestamp` (`created`),
  KEY `crc64` (`crc64`),
  FULLTEXT KEY `text` (`text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `teaching_aids`
--

CREATE TABLE IF NOT EXISTS `teaching_aids` (
  `teaching_aids_id` int(3) NOT NULL AUTO_INCREMENT,
  `teaching_aids_name` varchar(50) NOT NULL,
  `teaching_aids_alias` varchar(10) NOT NULL,
  `remarks` varchar(50) NOT NULL,
  `teaching_aids_created_by` int(5) NOT NULL,
  `teaching_aids_created_date` datetime NOT NULL,
  PRIMARY KEY (`teaching_aids_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `teaching_methods`
--

CREATE TABLE IF NOT EXISTS `teaching_methods` (
  `teaching_methods_id` int(3) NOT NULL AUTO_INCREMENT,
  `teaching_methods_name` varchar(50) NOT NULL,
  `teaching_methods_alias` varchar(10) NOT NULL,
  `remarks` varchar(50) NOT NULL,
  `teaching_methods_created_by` int(3) NOT NULL,
  `teaching_methods_created_date` datetime NOT NULL,
  PRIMARY KEY (`teaching_methods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_organization_email_id` varchar(60) NOT NULL,
  `user_password` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_type` varchar(15) NOT NULL,
  `user_created_by` int(3) NOT NULL,
  `user_creation_date` datetime NOT NULL,
  `user_organization_id` int(5) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_user_id` (`user_organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `year`
--

CREATE TABLE IF NOT EXISTS `year` (
  `year_id` int(2) NOT NULL AUTO_INCREMENT,
  `year` int(4) NOT NULL,
  PRIMARY KEY (`year_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
