//
//  ImodPerformanceLogic.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 4/6/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import Foundation

class ImodPerformanceLogic {
    
    // MARK: - Public Methods for List.
    
    func fetchDomainCategoryList( learningDomainName : String ) -> [String] {
        switch (learningDomainName) {
            case "Cognitive" : return domainCategoryForCognitive
            case "Affective" : return domainCategoryForAffective
            case "Psychomotor" : return domainCategoryForPsychomotor
            default : return performanceDefaultList
        }
    }
    
    func fetchActionWordCategoryList( learningDomainName : String, domainCategoryName : String ) -> [String] {
        switch (learningDomainName) {
            case "Cognitive" : return fetchActionWordCategoryForCognitive(domainCategoryName: domainCategoryName)
            case "Affective" : return fetchActionWordCategoryForAffective(domainCategoryName: domainCategoryName)
            case "Psychomotor" : return fetchActionWordCategoryForPsychomotor(domainCategoryName: domainCategoryName)
            default : return performanceDefaultList
        }
    }
    
    func fetchActionWordList( learningDomainName : String, domainCategoryName : String, actionWordCategory : String ) -> [String] {
        switch (learningDomainName) {
            case "Cognitive" : return fetchActionWordForCognitive(domainCategoryName: domainCategoryName, actionWordCategory: actionWordCategory)
            case "Affective" : return fetchActionWordForAffective(domainCategoryName: domainCategoryName, actionWordCategory: actionWordCategory)
            case "Psychomotor" : return fetchActionWordForPsychomotor(domainCategoryName: domainCategoryName, actionWordCategory: actionWordCategory)
            default : return performanceDefaultList
        }
    }
    
    // MARK: - Private Methods for List.
    
    // Action Word Categories
    fileprivate func fetchActionWordCategoryForCognitive(domainCategoryName : String) -> [String] {
        switch (domainCategoryName) {
            case "Remember" :   return actionWordCategoryForRemember
            case "Understand" : return actionWordCategoryForUnderstand
            case "Apply" :      return actionWordCategoryForApply
            case "Analyze" :    return actionWordCategoryForAnalyze
            case "Evaluate" :   return actionWordCategoryForEvaluate
            case "Create" :     return actionWordCategoryForCreate
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordCategoryForAffective(domainCategoryName : String) -> [String] {
        switch (domainCategoryName) {
            case "Receiving Phenomena" :    return actionWordCategoryForReceivingPhenomena
            case "Respond" :                return actionWordCategoryForRespond
            case "Value" :                  return actionWordCategoryForValue
            case "Organisation" :           return actionWordCategoryForOrganisation
            case "Internalizing Values" :   return actionWordCategoryForInternalizingValues
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordCategoryForPsychomotor(domainCategoryName : String) -> [String] {
        switch (domainCategoryName) {
            case "Perception" :             return actionWordCategoryForPerception
            case "Set" :                    return actionWordCategoryForSet
            case "Guided Response" :        return actionWordCategoryForGuidedResponse
            case "Mechanism" :              return actionWordCategoryForMechanism
            case "Complex Overt Response" : return actionWordCategoryForComplexOvertResponse
            case "Adapation" :              return actionWordCategoryForAdaptation
            case "Origination" :            return actionWordCategoryForOrigination
            default : return performanceDefaultList
        }
    }
    
    // Action Word Categories
    
    // First Level
    fileprivate func fetchActionWordForCognitive(domainCategoryName : String, actionWordCategory: String) -> [String] {
        switch (domainCategoryName) {
            case "Remember" :   return fetchActionWordForCognitiveAndRemember(actionWordCategory: actionWordCategory)
            case "Understand" : return fetchActionWordForCognitiveAndUnderstand(actionWordCategory: actionWordCategory)
            case "Apply" :      return fetchActionWordForCognitiveAndApply(actionWordCategory: actionWordCategory)
            case "Analyze" :    return fetchActionWordForCognitiveAndAnalyze(actionWordCategory: actionWordCategory)
            case "Evaluate" :   return fetchActionWordForCognitiveAndEvaluate(actionWordCategory: actionWordCategory)
            case "Create" :     return fetchActionWordForCognitiveAndCreate(actionWordCategory: actionWordCategory)
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForAffective(domainCategoryName : String, actionWordCategory: String) -> [String] {
        switch (domainCategoryName) {
            case "Receiving Phenomena" :    return fetchActionWordForAffectiveAndReceivingPhenomena(actionWordCategory: actionWordCategory)
            case "Respond" :                return fetchActionWordForAffectiveAndRespond(actionWordCategory: actionWordCategory)
            case "Value" :                  return fetchActionWordForAffectiveAndValue(actionWordCategory: actionWordCategory)
            case "Organisation" :           return fetchActionWordForAffectiveAndOrganisation(actionWordCategory: actionWordCategory)
            case "Internalizing Values" :   return fetchActionWordForAffectiveAndInternalizingValues(actionWordCategory: actionWordCategory)
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForPsychomotor(domainCategoryName : String, actionWordCategory: String ) -> [String] {
        switch (domainCategoryName) {
            case "Perception" :             return fetchActionWordForPsychomotorAndPerception(actionWordCategory: actionWordCategory)
            case "Set" :                    return fetchActionWordForPsychomotorAndSet(actionWordCategory: actionWordCategory)
            case "Guided Response" :        return fetchActionWordForPsychomotorAndGuidedResponse(actionWordCategory: actionWordCategory)
            case "Mechanism" :              return fetchActionWordForPsychomotorAndMechanism(actionWordCategory: actionWordCategory)
            case "Complex Overt Response" : return fetchActionWordForPsychomotorAndComplexOvertResponse(actionWordCategory: actionWordCategory)
            case "Adapation" :              return fetchActionWordForPsychomotorAndAdapation(actionWordCategory: actionWordCategory)
            case "Origination" :            return fetchActionWordForPsychomotorAndOrigination(actionWordCategory: actionWordCategory)
            default : return performanceDefaultList
        }
    }

    // Second Level
    
    fileprivate func fetchActionWordForCognitiveAndRemember(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Recall" :      return actionWordsForRecall
            case "Recognize" :   return actionWordsForRecognize
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForCognitiveAndUnderstand(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Classify" :   return actionWordsForClassify
            case "Compare" :    return actionWordsForCompare
            case "Exemplify" :  return actionWordsForExemplify
            case "Explain" :    return actionWordsForExplain
            case "Infer" :      return actionWordsForInfer
            case "Interpret" :  return actionWordsForInterpret
            case "Summarize" :  return actionWordsForSummarize
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForCognitiveAndApply(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Execute" :     return actionWordsForExecute
            case "Implement" :   return actionWordsForImplement
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForCognitiveAndAnalyze(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Attribute" :      return actionWordsForAttribute
            case "Differentiate" :  return actionWordsForDifferentiate
            case "Organize" :       return actionWordsForOrganize
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForCognitiveAndEvaluate(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Check" :      return actionWordsForCheck
            case "Critique" :   return actionWordsForCritique
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForCognitiveAndCreate(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Generate" :   return actionWordsForGenerate
            case "Plan" :       return actionWordsForPlan
            case "Produce" :    return actionWordsForProduce
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForAffectiveAndReceivingPhenomena(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Listens" :    return actionWordsForListens
            case "Names" :      return actionWordsForNames
            case "Remembers" :  return actionWordsForRemembers
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForAffectiveAndRespond(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Discusses" :      return actionWordsForDiscusses
            case "Participates" :   return actionWordsForParticipates
            case "Practices" :      return actionWordsForPractices
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForAffectiveAndValue(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Demonstrates" :   return actionWordsForDemonstrates
            case "Follows" :        return actionWordsForFollows
            case "Informs" :        return actionWordsForInforms
            case "Proposes" :       return actionWordsForProposes
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForAffectiveAndOrganisation(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Alters" :     return actionWordsForAlters
            case "Creates" :    return actionWordsForCreates
            case "Explains" :   return actionWordsForExplains
            case "Recognizes" : return actionWordsForRecognizes
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForAffectiveAndInternalizingValues(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Cooperates" :   return actionWordsForCooperates
            case "Displays" :     return actionWordsForDisplays
            case "Revises" :      return actionWordsForRevises
            case "Uses" :         return actionWordsForUses
            case "Values" :       return actionWordsForValues
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForPsychomotorAndPerception(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Adjusts" :   return actionWordsForAdjusts
            case "Detects" :   return actionWordsForDetects
            case "Estimates" : return actionWordsForEstimates
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForPsychomotorAndSet(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Knows" :      return actionWordsForKnows
            case "Recognises" : return actionWordsForRecognises
            case "Shows" :      return actionWordsForShows
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForPsychomotorAndGuidedResponse(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Following" :   return actionWordsForFollowing
            case "Performs" :    return actionWordsForPerforms
            case "Responds" :    return actionWordsForResponds
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForPsychomotorAndMechanism(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Drives" :    return actionWordsForDrives
            case "Repairs" :   return actionWordsForRepairs
            case "Using" :     return actionWordsForUsing
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForPsychomotorAndComplexOvertResponse(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Displays" :   return actionWordsForDisplays2
            case "Maneuvers" :  return actionWordsForManeuvers
            case "Operates" :   return actionWordsForOperates
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForPsychomotorAndAdapation(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Modifies" :   return actionWordsForModifies
            case "Perform" :    return actionWordsForPeform
            case "Response" :   return actionWordsForResponse
            default : return performanceDefaultList
        }
    }
    
    fileprivate func fetchActionWordForPsychomotorAndOrigination(actionWordCategory: String) -> [String] {
        switch (actionWordCategory) {
            case "Constructs" :   return actionWordsForConstructs
            case "Creating" :     return actionWordsForCreating
            case "Develops" :     return actionWordsForDevelops
            default : return performanceDefaultList
        }
    }
}
