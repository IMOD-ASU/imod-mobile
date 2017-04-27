//
//  ImodCourse.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 3/9/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import Foundation
import CoreData

class ImodCourse {
    
    // MARK : - IMODS Course Model
    var profileName : String = ""

    var courseTitle : String = ""
    var courseNumber : String = ""
    var courseURL : String = ""
    var classroomLocation : String = ""
    var semester : String = ""
    
    var overview : String = ""
    var subjectArea : String = ""
    var audience : Int = 0
    var creditHours : Int = 0
    var timeRatio : String = ""
    var numberOfSeats : Int = 0
    
    var startDate : Date = Date()
    var endDate : Date = Date()
    var repeats : Int = 0
    var repeatsEvery : Int = 0
    var repeatsOn : [String] = []
    
    var gradingProcedure : Int = 0
    var attendanceAndTardiness : String = attendanceAndTardinessDefault
    var classParticipation : String = classParticipationDefault
    var professionalConduct : String = professionalConductDefault
    var missedOrMakeUpExams : String = missedExamsDefault
    var missedAssignments : String = missedAssignmentsDefault
    
    var instructors = [SInstructor]()
    var learningObjectives = [ImodLearningObjective]()
    var courseContents = [ImodContent]()
    
    // MARK : - IMODS Course Constructors
    
    init() {
      // Do Nothing
    }
    
    init(managedObject: AnyObject) {
        
        // Populate the Courses Field Accordingly from the Core Data
        self.profileName = (managedObject.value(forKey: "profileName") as? String)!

        // Fetch and Populate Course Details
        let courseDetailsDB = (managedObject.value(forKey: "hasCourseDetails")) as AnyObject
        self.courseTitle = (courseDetailsDB.value(forKey: "courseTitle") as? String)!
        self.courseNumber = (courseDetailsDB.value(forKey: "courseNumber") as? String)!
        self.courseURL = (courseDetailsDB.value(forKey: "courseURL") as? String)!
        self.classroomLocation = (courseDetailsDB.value(forKey: "classroomLocation") as? String)!
        self.semester = (courseDetailsDB.value(forKey: "semester") as? String)!
        
        // Fetch and Populate Course Description
        let courseDescriptionDB = (managedObject.value(forKey: "hasCourseDescription")) as AnyObject
        self.overview = (courseDescriptionDB.value(forKey: "overview") as? String)!
        self.subjectArea = (courseDescriptionDB.value(forKey: "subjectArea") as? String)!
        self.audience = (courseDescriptionDB.value(forKey: "audience") as? Int)!
        self.creditHours = (courseDescriptionDB.value(forKey: "creditHours") as? Int)!
        self.timeRatio = (courseDescriptionDB.value(forKey: "timeRatio") as? String)!
        self.numberOfSeats = (courseDescriptionDB.value(forKey: "numberOfSeats") as? Int)!
        
        // Fetch and Populate Schedule
        let scheduleDB = (managedObject.value(forKey: "hasSchedule")) as AnyObject
        self.startDate = (scheduleDB.value(forKey: "startDate") as? Date)!
        self.endDate = (scheduleDB.value(forKey: "endDate") as? Date)!
        self.repeats = (scheduleDB.value(forKey: "repeats") as? Int)!
        self.repeatsEvery = (scheduleDB.value(forKey: "repeatsEvery") as? Int)!
        
        // Fetch and Populate RepeatsOn
        let repeatsOnDB = (scheduleDB.mutableSetValue(forKey: "hasRepeatsOn"))
        for repeatsOnDB in repeatsOnDB {
            let repeatOnTitle = ((repeatsOnDB as AnyObject).value(forKey: "repeatsOn") as? String)!
            self.repeatsOn.append(repeatOnTitle)
        }
        
        // Fetch and Populate Course Policy
        let coursePolicyDB = (managedObject.value(forKey: "hasCoursePolicy")) as AnyObject
        self.gradingProcedure = (coursePolicyDB.value(forKey: "gradingProcedure") as? Int)!
        self.attendanceAndTardiness = (coursePolicyDB.value(forKey: "attendanceAndTardiness") as? String)!
        self.classParticipation = (coursePolicyDB.value(forKey: "classParticipation") as? String)!
        self.professionalConduct = (coursePolicyDB.value(forKey: "professionalConduct") as? String)!
        self.missedOrMakeUpExams = (coursePolicyDB.value(forKey: "missedOrMakeUpExams") as? String)!
        self.missedAssignments = (coursePolicyDB.value(forKey: "missedAssignments") as? String)!
        
        // Fetch and Populate Instructors
        let instructorsDB = (managedObject.mutableSetValue(forKey: "hasInstructors"))
        for instructorDB in instructorsDB {
            var instructor = SInstructor(managedObject: instructorDB as AnyObject)
            self.instructors.append(instructor)
        }
        
        // Fetch and Populate Learning Objectives
        let objectivesDB = (managedObject.mutableSetValue(forKey: "hasLearningObjective"))
        for objectiveDB in objectivesDB {
            var objective = ImodLearningObjective(managedObject: objectiveDB as AnyObject)
            self.learningObjectives.append(objective)
        }
        
        // Fetch and Populate Main Contents
        let mainContentsDB = (managedObject.mutableSetValue(forKey: "hasMainContents"))
        for mainContent in mainContentsDB {
            var mainContent = ImodContent(managedObject: mainContent as AnyObject)
            self.courseContents.append(mainContent)
        }
    }
    
    // MARK: - Model Public Methods
    func createCourseForDB(managedObjectContext : NSManagedObjectContext?) -> NSManagedObject {
        let courseOverviewEntity = NSEntityDescription.entity(forEntityName: "CourseOverview", in: managedObjectContext!)
        let courseOverview = NSManagedObject(entity: courseOverviewEntity!, insertInto: managedObjectContext!)
        courseOverview.setValue(self.profileName, forKey: "profileName")
        
        // Adding Values for Course Details
        let courseDetailsEntity = NSEntityDescription.entity(forEntityName: "CourseDetails", in: managedObjectContext!)
        let courseDetails = NSManagedObject(entity: courseDetailsEntity!, insertInto: managedObjectContext!)
        courseDetails.setValue(self.courseTitle, forKey: "courseTitle")
        courseDetails.setValue(self.courseNumber, forKey: "courseNumber")
        courseDetails.setValue(self.courseURL, forKey: "courseURL")
        courseDetails.setValue(self.classroomLocation, forKey: "classroomLocation")
        courseDetails.setValue(self.semester, forKey: "semester")
        courseOverview.setValue(courseDetails, forKey: "hasCourseDetails")
        
        // Adding Values for Course Description
        let courseDescriptionEntity = NSEntityDescription.entity(forEntityName: "CourseDescription", in: managedObjectContext!)
        let courseDescription = NSManagedObject(entity: courseDescriptionEntity!, insertInto: managedObjectContext!)
        courseDescription.setValue(self.overview, forKey: "overview")
        courseDescription.setValue(self.subjectArea, forKey: "subjectArea")
        courseDescription.setValue(self.audience, forKey: "audience")
        courseDescription.setValue(self.creditHours, forKey: "creditHours")
        courseDescription.setValue(self.timeRatio, forKey: "timeRatio")
        courseDescription.setValue(self.numberOfSeats, forKey: "numberOfSeats")
        courseOverview.setValue(courseDescription, forKey: "hasCourseDescription")
        
        // Adding Values for Schedule
        let scheduleEntity = NSEntityDescription.entity(forEntityName: "Schedule", in: managedObjectContext!)
        let schedule = NSManagedObject(entity: scheduleEntity!, insertInto: managedObjectContext!)
        schedule.setValue(self.startDate, forKey: "startDate")
        schedule.setValue(self.endDate, forKey: "endDate")
        schedule.setValue(self.repeats, forKey: "repeats")
        schedule.setValue(self.repeatsEvery, forKey: "repeatsEvery")
        
        // Adding Values for Schedule RepeatsOn
        let fetchedRepeatsOn = schedule.mutableSetValue(forKey: "hasRepeatsOn")
        for repeatOnObject in self.repeatsOn {
            let scheduleRepeatsOnEntity = NSEntityDescription.entity(forEntityName: "ScheduleRepeatsOn", in: managedObjectContext!)
            let scheduleRepeatsOnDB = NSManagedObject(entity: scheduleRepeatsOnEntity!, insertInto: managedObjectContext!)
            scheduleRepeatsOnDB.setValue(repeatOnObject, forKey: "repeatsOn")
            fetchedRepeatsOn.add(scheduleRepeatsOnDB)
        }
        schedule.setValue(fetchedRepeatsOn, forKey: "hasRepeatsOn")
        courseOverview.setValue(schedule, forKey: "hasSchedule")
        
        // Adding Values for Course Policy
        let coursePolicyEntity = NSEntityDescription.entity(forEntityName: "CoursePolicy", in: managedObjectContext!)
        let coursePolicy = NSManagedObject(entity: coursePolicyEntity!, insertInto: managedObjectContext!)
        coursePolicy.setValue(self.gradingProcedure, forKey: "gradingProcedure")
        coursePolicy.setValue(self.attendanceAndTardiness, forKey: "attendanceAndTardiness")
        coursePolicy.setValue(self.classParticipation, forKey: "classParticipation")
        coursePolicy.setValue(self.professionalConduct, forKey: "professionalConduct")
        coursePolicy.setValue(self.missedOrMakeUpExams, forKey: "missedOrMakeUpExams")
        coursePolicy.setValue(self.missedAssignments, forKey: "missedAssignments")
        courseOverview.setValue(coursePolicy, forKey: "hasCoursePolicy")
        
        // Add Values to Instructors
        let fetchedinstructors = courseOverview.mutableSetValue(forKey: "hasInstructors")
        for instructor in self.instructors {
            let instructorEntity = NSEntityDescription.entity(forEntityName: "Instructor", in: managedObjectContext!)
            let instructorDB = NSManagedObject(entity: instructorEntity!, insertInto: managedObjectContext!)
            instructorDB.setValue(instructor.firstName, forKey: "firstName")
            instructorDB.setValue(instructor.lastName, forKey: "lastName")
            instructorDB.setValue(instructor.email, forKey: "email")
            instructorDB.setValue(instructor.officeHours, forKey: "officeHours")
            instructorDB.setValue(instructor.webPage, forKey: "webPage")
            instructorDB.setValue(instructor.role, forKey: "role")
            instructorDB.setValue(instructor.officeLocation, forKey: "officeLocation")
            fetchedinstructors.add(instructorDB)
        }
        courseOverview.setValue(fetchedinstructors, forKey: "hasInstructors")
        
        // Add Values to Learning Objectives
        let fetchedobjectives = courseOverview.mutableSetValue(forKey: "hasLearningObjective")
        for objective in self.learningObjectives {
            let objectiveEntity = NSEntityDescription.entity(forEntityName: "LearningObjective", in: managedObjectContext!)
            let objectiveDB = NSManagedObject(entity: objectiveEntity!, insertInto: managedObjectContext!)
            objectiveDB.setValue(objective.learningObjectiveTitle, forKey: "objective")
            objectiveDB.setValue(objective.performanceString, forKey: "performanceString")
            objectiveDB.setValue(objective.conditionString, forKey: "conditionString")
            objectiveDB.setValue(objective.contentString, forKey: "contentString")
            objectiveDB.setValue(objective.criteriaString, forKey: "criteriaString")
            
            // Create for Condition
            let conditionEntity = NSEntityDescription.entity(forEntityName: "Condition", in: managedObjectContext!)
            let conditionDB = NSManagedObject(entity: conditionEntity!, insertInto: managedObjectContext!)
            conditionDB.setValue(objective.objectiveCondition.hideFromStudents, forKey: "hideFromStudents")
            conditionDB.setValue(objective.objectiveCondition.conditionType.rawValue, forKey: "conditionType")
            conditionDB.setValue(objective.objectiveCondition.condition, forKey: "condition")
            objectiveDB.setValue(conditionDB, forKey: "hasCondition")
            
            // Create for Content
            let fetchedContents = objectiveDB.mutableSetValue(forKey: "hasContent")
            for content in objective.objectiveContent {
                let contentEntity = NSEntityDescription.entity(forEntityName: "Content", in: managedObjectContext!)
                let contentDB = NSManagedObject(entity: contentEntity!, insertInto: managedObjectContext!)
                contentDB.setValue(content, forKey: "contentTopic")
                fetchedContents.add(contentDB)
            }
            objectiveDB.setValue(fetchedContents, forKey: "hasContent")
            
            // Create for Criteria
            let criteriaEntity = NSEntityDescription.entity(forEntityName: "Criteria", in: managedObjectContext!)
            let criteriaDB = NSManagedObject(entity: criteriaEntity!, insertInto: managedObjectContext!)
            criteriaDB.setValue(objective.objectiveCriteria.accuracy, forKey: "accuracy")
            criteriaDB.setValue(objective.objectiveCriteria.quality, forKey: "quality")
            criteriaDB.setValue(objective.objectiveCriteria.quantity, forKey: "quantity")
            criteriaDB.setValue(objective.objectiveCriteria.speed, forKey: "speed")
            criteriaDB.setValue(objective.objectiveCriteria.hideFromStudentsForAccuracy, forKey: "hideAccuracy")
            criteriaDB.setValue(objective.objectiveCriteria.hideFromStudentsForQuality, forKey: "hideQuality")
            criteriaDB.setValue(objective.objectiveCriteria.hideFromStudentsForQuantity, forKey: "hideQuantity")
            criteriaDB.setValue(objective.objectiveCriteria.hideFromStudentsForSpeed, forKey: "hideSpeed")
            criteriaDB.setValue(objective.objectiveCriteria.enableAccuracy, forKey: "enableAccuracy")
            criteriaDB.setValue(objective.objectiveCriteria.enableQuality, forKey: "enableQuality")
            criteriaDB.setValue(objective.objectiveCriteria.enableQuantity, forKey: "enableQuantity")
            criteriaDB.setValue(objective.objectiveCriteria.enableSpeed, forKey: "enableSpeed")
            objectiveDB.setValue(criteriaDB, forKey: "hasCriteria")
            
            // Create for Peformance
            let performanceEntity = NSEntityDescription.entity(forEntityName: "Performance", in: managedObjectContext!)
            let performanceDB = NSManagedObject(entity: performanceEntity!, insertInto: managedObjectContext!)
            performanceDB.setValue(objective.objectivePeformance.learningDomain, forKey: "learningDomain")
            performanceDB.setValue(objective.objectivePeformance.domainCategory, forKey: "domainCategory")
            performanceDB.setValue(objective.objectivePeformance.actionWordCategory, forKey: "actionCategory")
            performanceDB.setValue(objective.objectivePeformance.actionWord, forKey: "actionWord")
            objectiveDB.setValue(performanceDB, forKey: "hasPerformance")
            
            fetchedobjectives.add(objectiveDB)
        }
        courseOverview.setValue(fetchedobjectives, forKey: "hasLearningObjective")
        
        // Add Values to Main Topic Contents
        let fetchedTopics = courseOverview.mutableSetValue(forKey: "hasMainContents")
        for contentTopic in self.courseContents {
            let contentEntity = NSEntityDescription.entity(forEntityName: "MainContent", in: managedObjectContext!)
            let contentDB = NSManagedObject(entity: contentEntity!, insertInto: managedObjectContext!)
            contentDB.setValue(contentTopic.contentTopic, forKey: "topic")
            contentDB.setValue(contentTopic.contentPriority, forKey: "priority")
            contentDB.setValue(contentTopic.contentPreReq, forKey: "preReq")
            
            // Create for KnowledgeDimensions
            let fetchedKnowledgeDimensions = contentDB.mutableSetValue(forKey: "hasKnowledgeDimensions")
            for kdimension in contentTopic.contentKnowledgeDimensions {
                let knowledgeDimensionsEntity = NSEntityDescription.entity(forEntityName: "KnowledgeDimensions", in: managedObjectContext!)
                let knowledgeDimensionsDB = NSManagedObject(entity: knowledgeDimensionsEntity!, insertInto: managedObjectContext!)
                knowledgeDimensionsDB.setValue(kdimension, forKey: "knowledgeDimension")
                fetchedKnowledgeDimensions.add(knowledgeDimensionsDB)
            }
            contentDB.setValue(fetchedKnowledgeDimensions, forKey: "hasKnowledgeDimensions")
            
            // Create for Resources
            let fetchedResources = contentDB.mutableSetValue(forKey: "hasResources")
            for resource in contentTopic.contentResources {
                let resourcesEntity = NSEntityDescription.entity(forEntityName: "Resources", in: managedObjectContext!)
                let resourceDB = NSManagedObject(entity: resourcesEntity!, insertInto: managedObjectContext!)
                resourceDB.setValue(resource.resourceTitle, forKey: "title")
                resourceDB.setValue(resource.resourceDescription, forKey: "resourceDescription")
                resourceDB.setValue(resource.resourceType, forKey: "resourceType")
                fetchedResources.add(resourceDB)
            }
            contentDB.setValue(fetchedResources, forKey: "hasResources")
            fetchedTopics.add(contentDB)
        }
        courseOverview.setValue(fetchedTopics, forKey: "hasMainContents")
        return courseOverview
    }
    
}

extension Date {
        init(dateString : String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        let d = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:d)
    }
}
