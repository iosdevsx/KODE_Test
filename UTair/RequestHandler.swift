//
//  RequestHandler
//  UTair
//
//  Created by Юрий Логинов on 09.06.17.
//  Copyright © 2017 Yury Loginov. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON


class RequestHandler {
    
    /// Input, Output параметры
    struct Input {
        var method: HTTPMethod
        var url: String
        var params: Dictionary<String, Any>?
        var responseClass: Any
        var needAuthorization: Bool
    }
    
    struct Output {
        var response:Any
    }
    
    enum Result {
        case failure
        case success(Output)
    }
    
    /// Основной метод по выполнению запросов
    static func request(_ input:Input) -> ResultHandler {
        let resultHandler = ResultHandler()
        performRequest(resultHandler.invokeCallbacks, input: input)
        return resultHandler
    }
    
    
    /// Собирает Request используя Alamofire и выполняет запрос
    fileprivate static func performRequest(_ completion:@escaping (Result)->Void, input: Input) {
        
//        let url = "\(AppNetworkInfo.baseUrl)" + input.url
        
        let headers: [String:String]? = nil
        
        if input.needAuthorization {
//            headers = AuthInfo.shared.defaultHTTPHeaders()
        }
        
        Alamofire.request(input.url, method: input.method, parameters: input.params, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                
                let aClass = input.responseClass
                if let cls = aClass as? BaseMappable.Type {
                    if let jsonRaw = json.rawString() {
                        let obj = cls.init(JSONString: jsonRaw)
                        completion(.success(Output(response: obj!)))
                    }
                } else {
                    completion(.failure)
                }

            case .failure(_):
                completion(.failure)
            }
        }
    }
    
    fileprivate func stringClassFromString(_ className: String) -> AnyClass! {
        
        /// get namespace
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String;
        
        /// get 'anyClass' with classname and namespace
        let cls: AnyClass = NSClassFromString("\(namespace).\(className)")!;
        
        // return AnyClass!
        return cls;
    }
}

class ResultHandler {
    typealias SuccessClosure = (RequestHandler.Output)->Void
    typealias FailureClosure = ()->Void
    
    
    /// Массивы success и failure блоков
    fileprivate var _successQueue = Queue<SuccessClosure>()
    fileprivate var _failureQueue = Queue<FailureClosure>()
    
    /// Вызывает все сохраненные callbacks
    func invokeCallbacks(_ result:RequestHandler.Result) {
        
        switch result {
        case .success(let output):
            while (!_successQueue.isEmpty()) {
                _successQueue.dequeue()!(output)
            }
        case .failure:
            while (!_failureQueue.isEmpty()) {
                _failureQueue.dequeue()!()
            }
        }
    }
    
    /// Удаляет все callbacks
    func removeAllCallbacks() {
        _successQueue.first = nil
        _failureQueue.first = nil
    }
    
    /// Добавить новый success блок в массив
    @discardableResult func success(_ closure:@escaping SuccessClosure) -> Self {
        _successQueue.enqueue(data: closure)
        return self
    }
    
    /// Добавить новый failure блок в массив
    @discardableResult func failure(_ closure:@escaping FailureClosure) -> Self {
        _failureQueue.enqueue(data: closure)
        return self
    }
}
