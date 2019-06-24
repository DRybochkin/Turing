//
//  DataRequest+HttpDataRequestProtocol.swift
//  TuringHttpService
//
//  Created by Dmitry Rybochkin on 10/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Alamofire
import TuringHttpServiceInterface

extension Alamofire.DataRequest: HttpDataRequestProtocol { }
