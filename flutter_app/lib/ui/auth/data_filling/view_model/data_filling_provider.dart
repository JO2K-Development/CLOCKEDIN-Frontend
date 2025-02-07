import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/command.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/abstract/auth_repository.dart';
import 'package:flutter_app/data/repositories/abstract/current_user_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class DatafillingProvider with ChangeNotifier {
  // TextEditingControllers for form fields
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();

  DatafillingProvider({
    required CurrentUserRepository currentUserRepository,
  }) : _currentUserRepository = currentUserRepository {
    send = Command0(_send);
  }

  final CurrentUserRepository _currentUserRepository;
  late Command0 send;
  XFile? imageFile;
   
  final _log = Logger();


  Future<Result<void>> _send() async {
    try {
      if (firstnameController.text.isEmpty ||  lastnameController.text.isEmpty) {
        throw Exception("Both fields are required");
      }
      _log.i("sending the data: {firstname: ${firstnameController.text}, lastname: ${lastnameController.text}}");
      final result = await _currentUserRepository.fillData(
        firstName: firstnameController.text,
        lastName: lastnameController.text,
      );
      switch (result) {
        case Ok<void>():
          // Handle success
          _log.i("Datafill successful");
          break;
        case Error<void>():
          // Handle error
          _log.e(result.error);
          break;
      }
      return result;
    } catch (e) {
      // Handle network or other errors
      _log.e(e);
      return Result.error(e as Exception);
    } finally {
      notifyListeners();
    }
  }



  // Dispose controllers when not needed
  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    super.dispose();
  }
}
