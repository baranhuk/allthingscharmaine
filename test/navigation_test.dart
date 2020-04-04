
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../lib/core/viewmodels/loginviewmodel.dart';
import '../lib/core/viewmodels/shopVM.dart';
import '../lib/core/viewmodels/socialVM.dart';
import '../lib/core/viewmodels/user_creditcard_viewmodel.dart';
import '../lib/core/viewmodels/userviewmodel.dart';
import '../lib/ui/screens/signupscreens/login_screen.dart';
import '../lib/ui/screens/signupscreens/name_reg_screen.dart';


class MockNavigationObserver extends Mock implements NavigatorObserver{}
//class MockUserViewModel extends Mock implements UserViewModel{}
class MockUserViewModel extends Mock implements UserViewModel{}
class MockLoginViewModel extends Mock implements LoginViewmodel{}
class MockUserCreditCardViewmodel extends Mock implements UserCreditCardViewmodel{}
class MockSocialVM extends Mock implements SocialVM{}
class MockShopViewmodel extends Mock implements ShopVM{}


void main(){


  group('LoginScreen Navigation Test',(){
    NavigatorObserver mockObserver;
    UserViewModel mockUserViewModel;
    LoginViewmodel mockLoginViewmodel;
    UserCreditCardViewmodel mockUserCreditCardViewmodel;
    SocialVM mockSocialVM;
    ShopVM mockShopVM;

    setUp((){
   //   GetIt locator = GetIt.instance;
      //setupLocator();
/*
      locator.registerLazySingleton(() => UserViewModel());
      locator.registerLazySingleton(() => Api());
      locator.registerLazySingleton(() => LoginViewmodel());
      locator.registerLazySingleton(() => UserCreditCardViewmodel());
      locator.registerLazySingleton(()=> ShopVM());
      locator.registerLazySingleton(()=> SocialVM());
      */
      mockObserver = MockNavigationObserver();
       mockUserViewModel = UserViewModel();
       mockLoginViewmodel = LoginViewmodel();
       mockUserCreditCardViewmodel = UserCreditCardViewmodel();
       mockSocialVM = SocialVM();
      mockShopVM = ShopVM();

    });


    Future<Null> _buildLoginScreen(WidgetTester tester) async {
      await tester.pumpWidget(
          MultiProvider(
            providers:[



              ChangeNotifierProvider(
                create: (_) => mockUserViewModel,
              ),
              ChangeNotifierProvider(
                create: (_) => mockLoginViewmodel,
              ),
              ChangeNotifierProvider(
                create: (_) => mockUserCreditCardViewmodel,
              ),
              ChangeNotifierProvider(
                create: (_) => mockShopVM,
              ),
              ChangeNotifierProvider(
                create: (_) => mockSocialVM,
              )


            ],
            child: MaterialApp(
              home: LoginScreen(),



              /// This mocked observer will now receive all navigation events
              /// that happen in our app.
              navigatorObservers: [mockObserver],

            ),
          )
        );

      /// The tester.pumpWidget() call above just built our app widget
      /// and triggered the pushObserver method on the mockObserver once.
      verify(mockObserver.didPush(any, any));
    }

    Future<Null> _navigateToRegistrationScreen(WidgetTester tester) async {
      /// Tap the button which should navigate to the details page.
      /// By calling tester.pumpAndSettle(), we ensure that all animations
      /// have completed before we continue further.
      ///

      await tester.tap(find.byKey(LoginScreen.navigateToRegisterScreen));

      await tester.pumpAndSettle();
    }

    testWidgets('When you tap register button, app should navigate to register screen', (widgetTester) async{
      await  _buildLoginScreen(widgetTester);
      await _navigateToRegistrationScreen(widgetTester);

      verify(mockObserver.didPush(any, any));
      expect(find.byType(NameRegScreen), findsOneWidget);
    });
  });
}