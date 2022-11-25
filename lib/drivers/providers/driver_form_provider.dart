import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/drivers/models/drivers.dart';



class DriverFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Driver driver;

  DriverFormProvider( this.driver );

  updateAvailability( bool value ) {
    value = true;
    print(value);
    
    notifyListeners();
  }


  bool isValidForm() {
    print( driver.name );
    print( driver.lastName );
    print( driver.age );
    print( driver.dni );
    print( driver.district );
    print( driver.email );
    print( driver.password );
    print( driver.type );
    print( driver.model );
    print( driver.brand );
    print( driver.licencePlate );
    print( driver.licenceCode );
    print( driver.numberSeats );
    print( driver.phoneNumber );
    print( driver.puntuacion );
    print( driver.pfp );
    return formKey.currentState?.validate() ?? false;
  }

}