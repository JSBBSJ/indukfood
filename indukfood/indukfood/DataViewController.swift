//
//  DataViewController.swift
//  indukfood
//
//  Created by seungbeom on 2023/02/07.
//

import UIKit
import MapKit

class DataViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var textToSet: String?
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        // 정확도를 최고로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 위치 데이터를 추적하기 위해 사용자에게 승인 요구
        locationManager.requestWhenInUseAuthorization()
        // 위치 업데이트를 시작
        locationManager.startUpdatingLocation()
        // 위치 보기 설정
        myMapView.showsUserLocation = true
    }
    
    // 뷰에 보여줄 컨텐츠를 미리 로드하는 메서드
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameLabel.text = self.textToSet
        mapControll()
    }
    
    // 위도와 경도, 스팬을 입력받아 지도에 표시
    func goLocation(latitudeValue: CLLocationDegrees, longtudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMapView.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    // 특정 위도와 경도에 핀 설치
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtudeValue: longitudeValue, delta: span)
        myMapView.addAnnotation(annotation)
    }
    
    // textToSet.text 값에 따른 위도,경도 초기화
    func mapControll(){
        switch textToSet {
        case "밥은":
            setAnnotation(latitudeValue: 37.633954, longitudeValue: 127.05803, delta: 0.1)
        case "민들레초밥":
            setAnnotation(latitudeValue: 37.633391, longitudeValue: 127.057718, delta: 0.1)
        case "용궁":
            setAnnotation(latitudeValue: 37.628947, longitudeValue: 127.056616, delta: 0.1)
        case "하다식당":
            setAnnotation(latitudeValue: 37.633798, longitudeValue: 127.058247, delta: 0.1)
        case "한끼뚝딱":
            setAnnotation(latitudeValue: 37.632461, longitudeValue: 127.057281, delta: 0.1)
        case "김가네":
            setAnnotation(latitudeValue: 37.631553, longitudeValue: 127.057501, delta: 0.1)
        case "노랑통닭":
            setAnnotation(latitudeValue: 37.631068, longitudeValue: 127.058257, delta: 0.1)
        case "맘스터치":
            setAnnotation(latitudeValue: 37.629954, longitudeValue: 127.058299, delta: 0.1)
        case "빽다방":
            setAnnotation(latitudeValue: 37.628945, longitudeValue: 127.057439, delta: 0.1)
        default:
            return
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
