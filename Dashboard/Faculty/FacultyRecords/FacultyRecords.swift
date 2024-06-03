//////
//////  FacultyRecords.swift
//////  Director Dashboard
//////
//////  Created by ADJ on 13/03/2024.
//////
////
import Foundation

//struct feedback: Hashable , Decodable  ,Encodable {
//
//        var fb_details: String
//}
//
//class FeedBackViewModel: ObservableObject {
//
//    @Published var fb: [feedback] = []
//    //    @Published var f_id: [Int] = [] // To get ID
//
//    func fetchExistingFeedback() {
//        guard let url = URL(string: "http://localhost:4000/getfeedback")
//
//        else{
//            return
//        }
//        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
//
//            guard let data = data , error == nil
//
//            else {
//                return
//            }
//
//            // Convert to JSON
//
//            do{
//                let fbs = try JSONDecoder().decode([feedback].self, from: data)
//                DispatchQueue.main.async {
//                    self?.fb = fbs
//                    print("Fetched \(fbs.count) Faculties")
//                }
//            }
//            catch{
//                print("Error While Getting Data")
//            }
//        }
//        task.resume()
//    }
////    func markAsRead(_ feedback: feedback) {
////        if let index = fb.firstIndex(of: feedback) {
////            fb[index].isRead = true
////        }
////    }
//}


struct Feedback: Hashable, Decodable, Encodable {
    var fb_details: String
    var f_id: Int
    var c_id: Int
    var c_title: String
    var c_code: String
    var f_name: String
    var q_id: Int
    var p_id: Int
}

class FeedbackViewModel: ObservableObject {
    @Published var feedback: [Feedback] = []
    
    func fetchExistingFeedback(facultyID: Int, courseID: Int) {
        guard let url = URL(string: "http://localhost:4000/getfeedback?facultyID=\(facultyID)&courseID=\(courseID)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let feedback = try JSONDecoder().decode([Feedback].self, from: data)
                DispatchQueue.main.async {
                    self?.feedback = feedback
                    print("Fetched \(feedback.count) feedbacks")
                }
            } catch {
                print("Error while getting data: \(error)")
            }
        }
        
        task.resume()
    }
}

//struct Topic: Hashable , Decodable  ,Encodable {
//
//    var t_id: Int
//    var t_name: String
//    var status: String
//}
//
//class TopicViewModel: ObservableObject {
//
//    @Published var existing: [Topic] = []
//
//    func getCourseTopic(courseID: Int) {
//        guard let url = URL(string: "http://localhost:4000/getcoursetopics/\(courseID)") else {
//            print("Invalid URL")
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//
//            guard let data = data else {
//                print("No data received")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let questions = try decoder.decode([Topic].self, from: data)
//                DispatchQueue.main.async {
//                    self.existing = questions
//                }
//            } catch {
//                print("Error decoding data: \(error.localizedDescription)")
//            }
//        }
//        .resume()
//    }
//}
//
//struct SubTopic: Hashable , Decodable  ,Encodable {
//
//    var st_id: Int
//    var st_name: String
//    var status: String
//}
//
//class SubTopicViewModel: ObservableObject {
//
//    @Published var existing: [SubTopic] = []
//
//    func getTopicSubTopic(topicID: Int) {
//        guard let url = URL(string: "http://localhost:4000/getsubtopic/\(topicID)") else {
//            print("Invalid URL")
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//
//            guard let data = data else {
//                print("No data received")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let questions = try decoder.decode([SubTopic].self, from: data)
//                DispatchQueue.main.async {
//                    self.existing = questions
//                }
//            } catch {
//                print("Error decoding data: \(error.localizedDescription)")
//            }
//        }
//        .resume()
//    }
//}

struct CoveredTopic: Hashable , Decodable  ,Encodable {
    
    var f_id: Int
    var c_id: Int
    var t_id: Int
    var st_id: Int
    
}

class CoveredTopicViewModel: ObservableObject {

    @Published var existing: [CoveredTopic] = []

    func getTopicSubTopic(facultyID: Int) {
        guard let url = URL(string: "http://localhost:4000/coveredtopics/\(facultyID)") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let questions = try decoder.decode([CoveredTopic].self, from: data)
                DispatchQueue.main.async {
                    self.existing = questions
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }
        .resume()
    }
}

struct Topic: Hashable , Decodable  ,Encodable {

    var t_id: Int
    var t_name: String
    var status: String
}

class TopicViewModel: ObservableObject {

    @Published var existing: [Topic] = []

    func getCourseTopic(courseID: Int) {
        guard let url = URL(string: "http://localhost:4000/getcoursetopics/\(courseID)") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let questions = try decoder.decode([Topic].self, from: data)
                DispatchQueue.main.async {
                    self.existing = questions
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }
        .resume()
    }
}

struct SubTopic: Hashable , Decodable  ,Encodable {
    
    var t_id: Int
    var st_id: Int
    var st_name: String
    var status: String
    
}

class SubTopicViewModel: ObservableObject {

    @Published var existing: [SubTopic] = []

    func getTopicSubTopic(topicID: Int) {
        guard let url = URL(string: "http://localhost:4000/getsubtopic/\(topicID)") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let subTopic = try decoder.decode([SubTopic].self, from: data)
                DispatchQueue.main.async {
                    self.existing = subTopic
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }
        .resume()
    }
}

//struct TopicTaught: Hashable , Decodable  ,Encodable {
//
//    var f_id: Int
//    var t_id: Int
//    var st_id: Int
//}
//
//class TopicTaughtViewModel: ObservableObject {
//
//    @Published var taught: [TopicTaught] = []
//
//    func getTopicTaught(courseID: Int) {
//        guard let url = URL(string: "http://localhost:4000/coveredtopics/\(courseID)") else {
//            print("Invalid URL")
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//
//            guard let data = data else {
//                print("No data received")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let subTopic = try decoder.decode([TopicTaught].self, from: data)
//                DispatchQueue.main.async {
//                    self.taught = subTopic
//                }
//            } catch {
//                print("Error decoding data: \(error.localizedDescription)")
//            }
//        }
//        .resume()
//    }
//}

struct TopicTaught: Hashable, Decodable, Encodable {
    var f_id: Int
    var t_id: Int
    var st_id: Int
    var f_name: String
    var faculty_count: Int
}

class TopicTaughtViewModel: ObservableObject {
    @Published var taught: [TopicTaught] = []
    @Published var commonTopics: [Int: [Int]] = [:]

    func getTopicTaught(courseID: Int) {
        guard let url = URL(string: "http://localhost:4000/coveredtopics/\(courseID)") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let topics = try decoder.decode([TopicTaught].self, from: data)
                DispatchQueue.main.async {
                    self.taught = topics
                    self.commonTopics = self.findCommonTopics(topics: topics)
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }
        .resume()
    }

    private func findCommonTopics(topics: [TopicTaught]) -> [Int: [Int]] {
        var common: [Int: [Int]] = [:]
        for topic in topics {
            if topic.faculty_count > 1 {
                if common[topic.t_id] == nil {
                    common[topic.t_id] = []
                }
                common[topic.t_id]?.append(topic.st_id)
            }
        }
        return common
    }
}

struct CLO: Hashable , Decodable  ,Encodable {

    var clo_id: Int
    var clo_code: String
    var clo_text: String
    var status: String
    var enabledisable: String
    
}

class CLOViewModel: ObservableObject {

    @Published var existing: [CLO] = []

    func getCourseCLO(courseID: Int) {
        guard let url = URL(string: "http://localhost:4000/getclo/\(courseID)") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let questions = try decoder.decode([CLO].self, from: data)
                DispatchQueue.main.async {
                    self.existing = questions
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }
        .resume()
    }
}
struct TopicCLO: Hashable , Decodable  ,Encodable {

    var clo_code: String
    
}

class TopicCLOViewModel: ObservableObject {

    @Published var topicCLO: [TopicCLO] = []

    func getTopicCLO(topicID: Int) {
        guard let url = URL(string: "http://localhost:4000/gettopicclo/\(topicID)") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let topicclo = try decoder.decode([TopicCLO].self, from: data)
                DispatchQueue.main.async {
                    self.topicCLO = topicclo
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }
        .resume()
    }
}


struct CourseCLOGridViewWeightage: Hashable , Decodable  ,Encodable {
   
    var gvw_id: Int
    var clo_id: Int
    var clo_code: String
    var weightage1: Int
    var weightage2: Int
    var weightage3: Int
    var weightage4: Int
    
}
class CourseCLOGridViewWeightageViewModel: ObservableObject {
    
    @Published var CourseCLOgvh: [CourseCLOGridViewWeightage] = []
    
    func fetchExistingGridWeightage(courseID: Int) {
        guard let url = URL(string: "http://localhost:4000/getcourseclogvw/\(courseID)") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data returned")
                return
            }

            do {
                let grid = try JSONDecoder().decode([CourseCLOGridViewWeightage].self, from: data)
                DispatchQueue.main.async {
                    self?.CourseCLOgvh = grid
                    print("Fetched \(grid.count) Headers")
                }
            } catch {
                print("Error decoding !!!!data: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
