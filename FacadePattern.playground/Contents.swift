// Facade Pattern

import Foundation

struct Hotel {
    
}

struct HotelBooking {
    static func getHotelNameForDates(to: NSDate, from: NSDate) -> [Hotel]? {
        let hotels = [Hotel]()
        // 호텔을 가져오는 로직
        return hotels
    }
    
    static func bookHotel(hotel: Hotel) {
        // 호텔 객실을 예약하는 로직
    }
}

struct Flight {
    
}

struct FlightBooking {
    static func getFlightNameForDates(to: NSDate, from: NSDate) -> [Flight]? {
        let flights = [Flight]()
        // 항공기를 가져오는 로직
        return flights
    }
    
    static func bookFlight(hotel: Flight) {
        // 항공기를 예약하는 로직
    }
}

struct RentalCar {
    
}

struct RentalCarBooking {
    static func getRentalCarNameForDates(to: NSDate, from: NSDate) -> [RentalCar]? {
        let rentalCars = [RentalCar]()
        // 렌트카를 가져오는 로직
        return rentalCars
    }
    
    static func bookRentalCar(rentalCar: RentalCar) {
        // 렌트카를 예약하는 로직
    }
}

// Using Facade Pattern Example
struct TravelFacade {
    var hotels: [Hotel]?
    var flights: [Flight]?
    var rentalCars: [RentalCar]?
    
    init(to: NSDate, from: NSDate) {
        hotels = HotelBooking.getHotelNameForDates(to: to, from: from)
        flights = FlightBooking.getFlightNameForDates(to: to, from: from)
        rentalCars = RentalCarBooking.getRentalCarNameForDates(to: to, from: from)
    }
    
    func bookTrip(hotel: Hotel, flight: Flight, rentalCar: RentalCar) {
        HotelBooking.bookHotel(hotel: hotel)
        FlightBooking.bookFlight(hotel: flight)
        RentalCarBooking.bookRentalCar(rentalCar: rentalCar)
    }
}
