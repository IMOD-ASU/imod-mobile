//
//  menuOptionNames.swift
//  Imods Mobile
//
//  Created by Sohan Bangaru on 3/19/17.
//  Copyright © 2017 Sohan Madhav Bangaru. All rights reserved.
//

import Foundation

let masterTableName     = ["My Imods","Course Overview", "Learning Objectives", "Content", "Log Out"]
let masterDetailView    = [["My-imods"],
                           ["Course Details", "Course Description", "Schedule", "Course Policy", "Instructors"],
                           ["Objectives"],
                           ["Content"],
                           ["Log Out"]]
let audienceList        = ["No Audience", "Lower Division", "Upper Division", "Undergraduate", "Graduate"]
let repeatsList         = ["Daily", "Every Weekday (Monday to Friday)", "Every Monday and Wednesday",
                           "Every Monday, Wednesday and Friday", "Every Tuesday and Thursday", "Weekly"]
let repeatsEveryList    = ["Nothing Selected", "0", "1", "2", "3", "4", "5", "6", "8", "9", "10", "11", "12",
                           "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26",
                           "27", "28", "29", "30"]
let repeatsOnList       = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
let gradingProcedureList = ["Competency-Based", "Standardized", "Custom"]

let attendanceAndTardinessDefault = "Regular on-time attendance in this course is expected."
let classParticipationDefault = "Students are expected to participate in the educational process and not be a disruptive element with regard to the learning of others."
let professionalConductDefault = "All students should be familiar with the Student Code of Conduct, which can be found at http://www.asu.edu/studentlife/judicial/."
let missedExamsDefault = "The only legitimate reasons for missing an exam are business or university related travel or illness for more than half the assignment period with appropriate documentation. Contact your instructor to make appropriate arrangements."
let missedAssignmentsDefault = "Assignments should be turned in by the specified deadline. Late assignments will not be accepted unless prior arrangements have been made with the instructor."

let instructorRoleList = ["Select Role", "Assistant Professor", "Associate Professor", "Professor", "Teaching Assistant", "Course Assistant", "Grader"]

// MARK: - Learning Objectives
// MARK: - Performance
let learningDomainDefault = ["Cognitive", "Affective", "Psychomotor"]

// MARK: - Learning Domain: Cognitive
let domainCategoryForCognitive = ["Remember", "Understand", "Apply", "Analyze", "Evaluate", "Create"]

// MARK: - Learning Domain: Cognitive, Domain Category: Remember
let actionWordCategoryForRemember = ["Recall", "Recognize"]
// MARK: - Learning Domain: Cognitive, Domain Category: Understand
let actionWordCategoryForUnderstand = ["Classify", "Compare", "Exemplify", "Explain", "Infer", "Interpret", "Summarize"]
// MARK: - Learning Domain: Cognitive, Domain Category: Apply
let actionWordCategoryForApply = ["Execute", "Implement"]
// MARK: - Learning Domain: Cognitive, Domain Category: Analyze
let actionWordCategoryForAnalyze = ["Attribute", "Differentiate", "Organize"]
// MARK: - Learning Domain: Cognitive, Domain Category: Evaluate
let actionWordCategoryForEvaluate = ["Check", "Critique"]
// MARK: - Learning Domain: Cognitive, Domain Category: Create
let actionWordCategoryForCreate = ["Generate", "Plan", "Produce"]


// MARK: - Learning Domain: Cognitive, Domain Category: Remember, Action Word: Recall
let actionWordsForRecall = ["--Select--", "call", "call back", "call in", "call up", "cancel", "center", "centre", "come back", "concentrate", "denote", "echo", "focus", "hark back", "pore", "recollect", "refer", "remember", "resemble", "retrieve", "return", "rivet", "send for", "strike down", "take", "think", "withdraw", "abrogation", "annulment", "asking", "bugle call", "call", "callback", "memory", "recollection", "remembering", "reminiscence", "repeal", "request", "Other"]
// MARK: - Learning Domain: Cognitive, Domain Category: Remember, Action Word: Recognize
let actionWordsForRecognize = ["--Select--", "accept", "accost", "accredit", "acknowledge", "address", "agnize", "appreciate", "be", "call back", "call up", "certify", "cognize", "come up to", "discern", "distinguish", "give thanks", "greet", "know", "licence", "license", "make out", "pick out", "prize", "realize", "recall", "recognize", "recollect", "remember", "retrieve", "spot", "tell apart", "thank", "think", "treasure", "value", "--Other--"]

// MARK: - Learning Domain: Cognitive, Domain Category: Understand, Action Word: Classify
let actionWordsForClassify = ["--Select--", "aasign", "assort", "attribute", "categorize", "class", "relegate", "restrict", "seperate", "sort", "sort out", "--Other--"]
// MARK: - Learning Domain: Cognitive, Domain Category: Understand, Action Word: Compare
let actionWordsForCompare = ["--Select--", "analyse", "analyze", "be", "canvas", "canvass", "consider", "equate", "examine", "inflect", "liken", "study", "alikeness", "comparability", "comparison", "equivalence", "likeness", "similitude", "--Other--"]
// MARK: - Learning Domain: Cognitive, Domain Category: Understand, Action Word: Exemplify
let actionWordsForExemplify = ["--Select--", "be", "dilate", "elaborate", "embody", "enlarge", "expand", "expatiate", "exposit", "expound", "flesh out", "illustrate", "instance", "lucubrate", "personify", "represent", "--Other--"]
// MARK: - Learning Domain: Cognitive, Domain Category: Understand, Action Word: Explain
let actionWordsForExplain = ["--Select--", "excuse", "explicate", "inform", "justify", "say", "state", "tell", "vindicate", "--Other--"]
// MARK: - Learning Domain: Cognitive, Domain Category: Understand, Action Word: Infer
let actionWordsForInfer = ["--Select--", "believe", "conclude", "deduce", "deduct", "derive", "extrapolate", "figure out", "generalize", "guess", "lick" , "puzzle out" , "reason", "reason out", "solve", "understand", "work", "work out", "--Other--"]
// MARK: - Learning Domain: Cognitive, Domain Category: Understand, Action Word: Interpret
let actionWordsForInterpret = ["--Select--", "construe", "do", "execute", "explain", "explicate", "ingeminate", "iterate", "perform", "re-create", "read", "rede", "reiterate", "render", "repeat", "represent", "restate", "retell", "see", "translate", "understand", "--Other--"]
// MARK: - Learning Domain: Cognitive, Domain Category: Understand, Action Word: Summarize
let actionWordsForSummarize = ["--Select--", "ingeminate", "iterate", "reiterate", "repeat", "restate", "resume", "retell", "say", "state", "sum", "sum up", "summarise", "tell", "--Other--"]

// MARK: - Learning Domain: Cognitive, Domain Category: Apply, Action Word: Execute
let actionWordsForExecute = ["--Select--", "accomplish", "action", "apply", "bump off", "carry out", "carry through", "complete", "dispatch", "do", "effect", "effectuate", "enforce", "finish", "fulfil", "fulfill", "hit", "implement", "kill", "murder", "off", "penalize", "perform", "polish off", "punish", "put to death", "remove", "run", "set up", "sign", "slay","--Other--"]
// MARK: - Learning Domain: Cognitive, Domain Category: Apply, Action Word: Implement
let actionWordsForImplement = ["--Select--", "apply", "carry out", "compel", "complete", "employ", "enforce", "finish", "follow out", "follow through", "follow up", "go through", "obligate", "put through", "use", "utilize", "instrumentality", "instrumentation", "--Other--"]

// MARK: - Learning Domain: Cognitive, Domain Category: Analyze, Action Word: Attribute
let actionWordsForAttribute = ["--Select--", "ascribe", "assign", "evaluate", "impute", "judge", "pass judgement", "abstraction", "concept", "conception", "construct", "dimension", "property","--Other--"]
// MARK: - Learning Domain: Cognitive, Domain Category: Analyze, Action Word: Differentiate
let actionWordsForDifferentiate = ["--Select--", "calculate", "characterize", "cipher", "compute", "cypher", "develop", "dissimilate", "distinguish", "evolve", "figure", "identify", "mark", "place", "qualify", "reckon", "secern", "secernate", "separate", "severalize", "specialize", "speciate", "tell", "tell apart", "work out","--Other--"]
// MARK: - Learning Domain: Cognitive, Domain Category: Analyze, Action Word: Organize
let actionWordsForOrganize = ["--Select--", "arrange", "care", "coordinate", "create", "deal", "devise", "direct", "engineer", "fall in", "form", "get together", "get up", "handle", "initiate", "join", "machinate", "make", "manage", "mastermind", "orchestrate", "organise", "pioneer", "plan", "prepare", "set up", "unionize","--Other--"]

// MARK: - Learning Domain: Cognitive, Domain Category: Evaluate, Action Word: Check
let actionWordsForCheck = ["--Select--", "agress", "agree", "alter", "analyse", "analyze", "arrest", "ascertain", "assure", "attack", "be", "block", "blockade", "break", "canvas", "canvass", "change", "charge", "check into", "check off", "check out", "check over", "check up on", "checker", "chequer", "chink", "condition", "consign", "contain", "control", "correspond", "crack", "curb", "cut", "defend", "delay", "determine", "develop", "discipline", "draw", "embarass", "ensure", "equal", "examine", "find out", "fit", "gibe", "go", "go over", "halt", "hinder", "hold", "hold back", "hold in", "insure", "issue", "jibe", "keep", "keep back", "learn", "look into", "make grow", "make out", "mark", "mark off", "match", "moderate", "modify", "move", "obstruct", "restrain", "retard", "see", "see to it", "stop", "study", "stymie", "stymy", "supress", "suss out", "tally", "tick", "tick off", "train", "turn back", "verify", "watch", "write out", "account", "appraisal", "arrest", "assay", "assessment", "balk", "bank check", "baulk", "bill", "bill of exchange", "blemish", "bridle", "check mark", "check-out procedure", "checkout", "cheque", "chess move", "chip", "chit", "cogent evidence", "confirmation", "curb", "defect", "deterrent", "difficulty", "draft", "halt", "handicap", "hinderance", "hitch", "impediment", "inaction", "inactiveness", "inactivity", "inspection", "invoice", "mar", "mark", "obstruction", "order of payment", "proof ", "restraint", "review", "stay", "stop", "stoppage", "substantiation", "tab", "tick", "verification", "weave","--Other--"]
// MARK: - Learning Domain: Cognitive, Domain Category: Evaluate, Action Word: Critique
let actionWordsForCritique = ["--Select--", "evaluate", "judge", "pass judgement", "review", "critical analysis", "critical appraisal", "critical review", "criticism", "literary criticism", "review", "review article","--Other--"]

// MARK: - Learning Domain: Cognitive, Domain Category: Create, Action Word: Generate
let actionWordsForGenerate = ["--Select--", "beget", "bring forth", "create", "engender", "father", "get", "give", "make","mother", "produce", "render", "return", "sire", "yeild","--Other--"]
// MARK: - Learning Domain: Cognitive, Domain Category: Create, Action Word: Plan
let actionWordsForPlan = ["--Select--", "be after", "cerebrate","cogitate", "contrive", "create by mental act", "create mentally", "design", "intend", "mean", "project", "think", "architectural plan", "arrangement", "design", "drawing", "idea", "organisation", "organization", "program", "programme", "system", "thought","--Other--"]
// MARK: - Learning Domain: Cognitive, Domain Category: Create, Action Word: Produce
let actionWordsForProduce = ["--Select--", "acquire", "bring about", "bring forth", "bring on", "bring out", "change", "create", "cultivate", "develop", "display", "exhibit", "expose", "farm", "get", "give rise", "grow", "make", "raise", "food", "garden truck", "green goods", "green groceries", "solid food","--Other--"]



// MARK: - Learning Domain: Affective
let domainCategoryForAffective = ["Receiving Phenomena", "Respond", "Value", "Organisation", "Internalizing Values"]

// MARK: - Learning Domain: Affective, Domain Category: Receiving Phenomena
let actionWordCategoryForReceivingPhenomena = ["Listens", "Names", "Remembers"]
// MARK: - Learning Domain: Affective, Domain Category: Respond
let actionWordCategoryForRespond = ["Discusses", "Participates", "Practices"]
// MARK: - Learning Domain: Affective, Domain Category: Value
let actionWordCategoryForValue = ["Demonstrates", "Follows", "Informs", "Proposes"]
// MARK: - Learning Domain: Affective, Domain Category: Organisation
let actionWordCategoryForOrganisation = ["Alters", "Creates", "Explains", "Recognizes"]
// MARK: - Learning Domain: Affective, Domain Category: Internalizing Values
let actionWordCategoryForInternalizingValues
 = ["Cooperates", "Displays", "Revises", "Uses", "Values"]


// MARK: - Learning Domain: Affective, Domain Category: Receiving Phenomena, Action Word: Listens
let actionWordsForListens = ["--Select--", "center", "centre", "comprehend", "concentrate", "focus", "hear", "heed", "mind","obey", "perceive", "pore", "rivet", "take heed","--Other--"]
// MARK: - Learning Domain: Affective, Domain Category: Receiving Phenomena, Action Word: Names
let actionWordsForNames = ["--Select--", "calumniation", "calumny", "defamation", "hatchet job", "name calling", "obloquy", "traducement","--Other--"]
// MARK: - Learning Domain: Affective, Domain Category: Receiving Phenomena, Action Word: Remembers
let actionWordsForRemembers = ["--Select--", "advert", "associate", "bequeath", "bring up", "call back", "call up", "cite", "colligate", "commemorate", "commend", "connect", "leave", "link", "link up", "mention", "name", "recall", "recollect", "refer", "relate", "retrieve", "think", "think back", "think of", "tie in", "will","--Other--"]

// MARK: - Learning Domain: Affective, Domain Category: Respond, Action Word: Discusses
let actionWordsForDiscusses = ["--Select--","--Other--"]
// MARK: - Learning Domain: Affective, Domain Category: Respond, Action Word: Participates
let actionWordsForParticipates = ["--Select--", "act", "enter", "move", "take part","--Other--"]
// MARK: - Learning Domain: Affective, Domain Category: Respond, Action Word: Practices
let actionWordsForPractices = ["--Select--", "apply", "do", "drill", "execute", "exercise", "learn", "perform", "practise", "read", "rehearse", "study", "take", "use", "activity", "cognition", "drill", "effectuation", "employment", "exercise", "grooming", "implementation", "knowledge", "noesis", "pattern", "practice session", "praxis", "preparation", "recitation", "training", "usage", "use", "utilisation", "utilization", "--Other--"]

// MARK: - Learning Domain: Affective, Domain Category: Value, Action Word: Demonstrates
let actionWordsForDemonstrates = ["--Select--", "affirm","attest", "bear witness", "certify", "confirm", "corroborate", "demo", "dissent", "establish", "evidence", "exhibit", "manifest", "march", "present", "protest", "prove", "resist", "shew", "show", "substantiate", "support", "sustain", "testify", "--Other--"]
// MARK: - Learning Domain: Affective, Domain Category: Value, Action Word: Follows
let actionWordsForFollows = ["--Select--", "abide by", "accompany", "act", "adopt", "analyse", "analyze", "apply", "arise", "be", "behave", "canvas", "canvass", "check", "check into", "check out", "check over", "check up on","choose", "come","come after", "comply", "conform to", "copy", "develop", "do", "ensue", "espouse", "examine", "fall out", "go", "go over", "grow", "hang in", "hang on", "imitate","keep abreast", "keep an eye on", "keep up", "locomote", "look into", "move", "obey", "observe", "originate", "persevere", "persist","pick out", "play", "play along", "post date", "practice", "pursue", "result", "rise", "select", "simulate", "spring up", "stick to", "stick with", "study", "succeed", "surveil", "survey", "suss out", "take", "take after", "trace", "travel", "travel along", "understand", "uprise", "use", "watch", "watch over","--Other--"]
// MARK: - Learning Domain: Affective, Domain Category: Value, Action Word: Informs
let actionWordsForInforms = ["--Select--", "alter", "change", "communicate", "inform", "intercommunicate", "modify","--Other--"]
// MARK: - Learning Domain: Affective, Domain Category: Value, Action Word: Proposes
let actionWordsForProposes = ["--Select--", "advise", "aim", "choose", "declare", "declare oneself", "intend", "mean", "nominate", "offer", "pick out", "plan", "pop the question", "project", "purport", "purpose", "request", "select", "suggest", "take", "think","--Other--"]

// MARK: - Learning Domain: Affective, Domain Category: Organisation, Action Word: Alters
let actionWordsForAlters = ["--Select--", "alter", "castrate", "change", "desex", "desexualize", "edit", "falsify", "fix", "interpolate", "modify", "neuter", "redact", "spay","sterilize", "unsex", "vary","--Other--"]
// MARK: - Learning Domain: Affective, Domain Category: Organisation, Action Word: Creates
let actionWordsForCreates = ["--Select--", "act", "appoint", "charge", "create", "make", "move", "produce","--Other--"]
// MARK: - Learning Domain: Affective, Domain Category: Organisation, Action Word: Explains
let actionWordsForExplains = ["--Select--", "excuse", "explicate", "inform", "justify", "say", "state", "tell", "vindicate","--Other--"]
// MARK: - Learning Domain: Affective, Domain Category: Organisation, Action Word: Recognizes
let actionWordsForRecognizes = ["--Select--", "accept", "accost", "accredit", "acknowledge", "address", "agnize", "appreciate", "be", "call back", "call up", "certify", "cognize", "come up to", "discern", "distinguish", "give thanks", "greet", "know", "licence", "license", "make out", "pick out", "prize", "realize", "recall", "recognise", "recollect", "remember", "retrieve", "spot", "tell apart", "thank", "think", "treasure", "value","--Other--"]

// MARK: - Learning Domain: Affective, Domain Category: Internalizing Values, Action Word: Cooperates
let actionWordsForCooperates = ["--Select--", "collaborate", "get together", "join forces", "work","--Other--"]
// MARK: - Learning Domain: Affective, Domain Category: Internalizing Values, Action Word: Displays
let actionWordsForDisplays = ["--Select--", "communicate", "court", "exhibit", "expose", "pass", "pass along", "pass on", "put across", "reveal","romance", "show", "solicit", "woo", "communication", "demo", "demonstration", "disclosure", "electronic device", "exhibit", "presentation", "representation", "revealing", "revelation", "show", "showing", "video display","--Other--"]
// MARK: - Learning Domain: Affective, Domain Category: Internalizing Values, Action Word: Revises
let actionWordsForRevises = ["--Select--", "reorganise", "reorganize", "retool", "rewrite", "shake up", "rescript", "revisal", "revising", "revision", "rewriting","--Other--"]
// MARK: - Learning Domain: Affective, Domain Category: Internalizing Values, Action Word: Uses
let actionWordsForUses = ["--Select--", "act", "apply", "consume", "employ", "expend", "exploit", "habituate", "have", "ingest", "move", "practice", "take", "take in", "utilize", "work", "activity", "consumption","custom", "demand", "economic consumption", "employment", "enjoyment", "exercise", "function", "habit", "influence", "legal right", "manipulation", "purpose", "role", "usage", "usance", "use of goods and services", "usefulness", "utilisation", "utility", "utilization", "wont","--Other--"]
// MARK: - Learning Domain: Affective, Domain Category: Internalizing Values, Action Word: Values
let actionWordsForValues = ["--Select--", "belief","--Other--"]




// MARK: - Learning Domain: Psychomotor
let domainCategoryForPsychomotor = ["Perception", "Set", "Guided Response", "Mechanism", "Complex Overt Response", "Adapation", "Origination"]

// MARK: - Learning Domain: Psychomotor, Domain Category: Perception
let actionWordCategoryForPerception = ["Adjusts", "Detects", "Estimates"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Set
let actionWordCategoryForSet = ["Knows", "Recognises", "Shows"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Guided Response
let actionWordCategoryForGuidedResponse = ["Following", "Performs", "Responds"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Mechanism
let actionWordCategoryForMechanism = ["Drives", "Repairs", "Using"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Complex Overt Response
let actionWordCategoryForComplexOvertResponse = ["Displays", "Maneuvers", "Operates"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Adaptation
let actionWordCategoryForAdaptation = ["Modifies", "Perform", "Response"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Origination
let actionWordCategoryForOrigination = ["Constructs", "Creating", "Develops"]

// MARK: - Learning Domain: Psychomotor, Domain Category: Perception, Action Word: Adjusts
let actionWordsForAdjusts = ["--Select--", "accomodate", "adapt", "adjudicate", "align", "aline", "alter", "change", "conform", "correct", "decide", "line up", "modify", "reorient", "resolve", "set", "settle","--Other--"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Perception, Action Word: Detects
let actionWordsForDetects = ["--Select--", "discover", "find", "notice", "observe", "sight","--Other--"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Perception, Action Word: Estimates
let actionWordsForEstimates = ["--Select--", "approximate", "calculate", "cipher", "compute", "count on", "cypher", "evaluate", "figure", "forecast", "gauge", "guess", "judge", "pass judgement", "reckon", "work out", "appraisal", "approximation", "assessment", "calculation", "commercial document", "commercial instrument", "computation", "esteem", "estimation", "figuring", "idea", "judgement", "judgment", "reckoning", "regard", "respect", "statement","--Other--"]


// MARK: - Learning Domain: Psychomotor, Domain Category: Set, Action Word: Knows
let actionWordsForKnows = ["--Select--", "accept", "acknowledge", "agnize", "bang", "be intimate", "bed", "bonk", "call back", "call up", "cognize", "copulate", "couple", "differentiate", "distinguish", "do it", "eff", "experience", "get it on", "get laid", "go through", "have a go at it", "have intercourse", "have it away", "have it off", "have sex", "hump", "jazz", "lie with", "live", "love", "make love", "make out", "mate", "pair", "realize", "recall", "recognize", "recollect", "remember", "retrieve", "roll in the hay", "screw", "secern", "secernate", "see", "separate", "severalize", "sleep with", "tell", "tell apart", "think", "undergo", "knowing","--Other--"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Set, Action Word: Recognises
let actionWordsForRecognises = ["--Select--", "accept", "accost", "accredit", "acknowledge", "address", "agnize", "appreciate", "call back", "certify", "cognize", "come up to", "discern", "distinguish", "give thanks", "greet", "know", "licence", "license", "make out","pick out", "prize", "realize", "recall", "recognize", "recollect", "remember", "retrieve", "tell apart", "thank", "think", "treasure", "value", "--Other--"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Set, Action Word: Shows
let actionWordsForShows = ["--Select--", "affirm", "appear", "bear witness", "communicate", "conduct", "confirm", "convey", "corroborate", "demo", "demonstrate", "depict", "direct", "display", "establish", "evidence", "evince", "exhibit", "express", "guide", "impart", "indicate", "inform", "interpret", "lead", "pass", "pass along", "pass on", "picture", "point", "present", "prove", "put across", "race", "read", "record", "register", "render", "represent", "reveal", "run", "shew", "show", "show up", "substantiate", "support", "sustain", "take", "testify", "usher", "amusement", "appearance", "demo", "demonstration", "display", "entertainment", "feigning", "pretence", "pretending", "pretense", "simulation", "social event","--Other--"]

// MARK: - Learning Domain: Psychomotor, Domain Category: Guided Response, Action Word: Following
let actionWordsForFollowing = ["--Select--", "chase", "followers", "hoi polloi", "mass", "masses", "motion", "move", "movement", "multitude", "people", "pursual", "pursuit", "the great unwashed", "next", "undermentioned","--Other--"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Guided Response, Action Word: Performs
let actionWordsForPerforms = ["--Select--", "accomplish", "act", "action", "carry out", "carry through", "do", "execute", "fulfil", "fulfill", "move", "re-create","--Other--"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Guided Response, Action Word: Responds
let actionWordsForResponds = ["--Select--", "act", "answer", "move", "react", "reply", "respond", "say", "state", "tell","--Other--"]

// MARK: - Learning Domain: Psychomotor, Domain Category: Mechanism, Action Word: Drives
let actionWordsForDrives = ["--Select--", "aim", "beat back", "coerce", "control", "cover", "cross","cut across", "cut through", "dig", "displace", "do work", "drive", "excavate", "fight", "force", "force back", "get", "get across", "get over", "go", "hale", "hit", "hollow", "hunt", "hunt down", "impel", "intend", "labor", "labour", "locomote", "make", "mean", "motor", "move", "operate", "pass over", "power", "pressure", "propel", "push", "push back", "ram", "repel", "repulse", "ride", "run", "squeeze", "struggle", "take", "throw", "thrust", "track", "track down", "travel", "traverse", "tug", "work", "actuation", "campaign", "cause", "conveyance", "crusade", "device", "driveway", "driving", "driving force", "effort", "golf shot", "golf stroke", "journey", "journeying", "mechanism", "movement", "parkway", "physiological condition","physiological state", "private road", "propulsion", "return", "ride", "road", "route", "swing", "thrust", "trait", "transfer", "transferral", "transportation", "venture","--Other--"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Mechanism, Action Word: Repairs
let actionWordsForRepairs = ["--Select--", "ameliorate", "amend", "animate", "arouse", "better", "brace", "bushel", "compensate", "correct", "doctor", "energize", "fix", "furbish up", "go", "improve", "indemnify", "locomote", "meliorate", "mend", "move", "pay", "perk up", "quicken", "reanimate", "recompense", "recreate", "rectify", "remediate", "remedy", "renovate", "resort", "restore", "revive", "revivify", "right", "stimulate", "touch on", "travel", "vivify", "area", "condition", "country", "fix", "fixing", "fixture", "hangout", "haunt", "improvement", "mend", "mending", "reparation", "resort", "stamping ground", "status","--Other--"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Mechanism, Action Word: Using
let actionWordsForUsing = ["--Select--", "exploitation", "mistreatment", "victimisation", "victimization","--Other--"]

// MARK: - Learning Domain: Psychomotor, Domain Category: Complex Overt Response, Action Word: Displays
let actionWordsForDisplays2 = ["--Select--", "communicate", "court", "exhibit", "expose", "pass", "pass along", "pass on", "put across", "reveal", "romance", "show", "solicit", "woo", "communication", "demo", "demonstration", "disclosure", "electronic device", "exhibit", "presentation", "representation", "revealing", "revelation", "show", "showing", "video display", "--Other--"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Complex Overt Response, Action Word: Maneuvers
let actionWordsForManeuvers = ["--Select--", "act", "channelize", "command", "control", "direct", "go", "guide", "head", "manoeuver", "manoeuvre", "move", "operate", "point", "steer", "evasion", "evasive action", "military operation", "motion", "move", "movement", "operation", "plan of action", "play", "simulated military operation", "tactic", "tactical maneuver", "tactical manoeuvre", "tactics","--Other--"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Complex Overt Response, Action Word: Operates
let actionWordsForOperates = ["--Select--", "care for", "come about", "control", "direct", "displace", "engage", "fall out", "function", "go", "go on", "hap", "happen", "lock", "maneuver", "manipulate", "manoeuver", "manoeuvre", "mesh", "move", "occur", "operate on", "pass", "pass off", "run", "take place", "treat", "work","--Other--"]

// MARK: - Learning Domain: Psychomotor, Domain Category: Adaptation, Action Word: Modifies
let actionWordsForModifies = ["--Select--","--Other--"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Adaptation, Action Word: Peform
let actionWordsForPeform = ["--Select--", "accomplish", "act", "action", "carry out","carry through", "do", "execute", "fulfil", "fulfill", "move", "re-create","--Other--"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Adaptation, Action Word: Response
let actionWordsForResponse = ["--Select--", "activity", "answer", "bodily function", "bodily process", "body process", "consequence", "effect", "event", "greeting", "issue", "outcome", "phrase","reaction", "reception", "reply", "result", "salutation", "speech act", "statement", "upshot", "--Other--"]

// MARK: - Learning Domain: Psychomotor, Domain Category: Origination, Action Word: Constructs
let actionWordsForConstructs = ["--Select--", "build", "conjecture", "create", "create by mental act", "create mentally", "delineate", "describe", "draw", "fabricate", "hypothecate", "hypothesize", "line", "make", "manufacture", "reconstruct", "retrace", "speculate", "suppose", "theorize", "trace", "concept", "conception", "idea", "thought", "--Other--"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Origination, Action Word: Creating
let actionWordsForCreating = ["--Select--","--Other--"]
// MARK: - Learning Domain: Psychomotor, Domain Category: Origination, Action Word: Develops
let actionWordsForDevelops = ["--Select--", "acquire", "alter", "ameliorate", "amend", "arise", "become", "better", "break", "bring forth", "build up", "change", "come about", "complicate", "conjecture", "create", "create by mental act", "create mentally", "educate", "elaborate", "evolve", "expand", "explicate", "fall out", "formulate", "generate", "germinate", "get", "get on", "grow", "hap", "happen", "hypothecate", "hypothesize", "improve", "instruct", "lay over", "learn", "make grow", "meliorate", "modernize", "modify","occur", "originate", "pass", "pass off", "play","prepare", "produce", "rarify", "recrudesce", "refine", "rise", "speculate", "spring up", "superimpose", "superpose", "suppose", "take place", "teach", "theorize", "train", "uprise", "--Other--"]

// Default PerformanceList
let performanceDefaultList = ["--Select--", "--Other--"]

// MARK: - Learning Objectives Condition List
let objectiveConditionList = ["Given a problem specification, the student will be able to", "Students completing this course will be able to", "After completing the course, the student will be able to"]
let knowledgeDimensionsList = ["Conceptual", "Factual", "Metacognitive", "Procedural"]
let priorityList = ["Critical", "Very Important", "Good to Know"]
let resourcesListDefault = ["Book", "Chapter", "Document", "URL"]

