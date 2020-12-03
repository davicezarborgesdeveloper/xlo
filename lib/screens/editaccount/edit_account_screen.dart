import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo/models/user.dart';
import 'package:xlo/screens/editaccount/widgets/user_type_widgets.dart';

class EditAccountScreen extends StatefulWidget {
  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {

final User _user = User(name: 'Daniel');

  @override
  Widget build(BuildContext context) {

    InputDecoration _buildDecoration(String label){
      return InputDecoration(
        labelText: label,
        contentPadding: const EdgeInsets.only(left:16,bottom: 8,top:8),
        );
    }
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Editar Conta'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            UserTypeWidget(
              initialValue: _user.userType,
              onSaved: (userType){

              },
            ),
            TextFormField(
              initialValue: _user.name,
              decoration: _buildDecoration('Nome *'),
              validator: (name) {
                if (name.length < 6) return 'Nome inválido';
                return null;
              },
              onSaved: (name){},
            ),
            TextFormField(
              initialValue: _user.phone,
              decoration: _buildDecoration('Telefone *'),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
              validator: (phone) {
                if (phone.length < 15) return 'Telefone inválido';
                return null;
              },
              onSaved: (phone){},
            ),
            TextFormField(
              obscureText: true,
              decoration: _buildDecoration('Nova senha'),
              keyboardType: TextInputType.phone,
              validator: (pass) {
                if (pass.length < 6) return 'Senha muito curta';
                return null;
              },
              autovalidate: false,
            ),
            TextFormField(
              obscureText: true,
              decoration: _buildDecoration('Repita nova senha'),
              keyboardType: TextInputType.phone,
              validator: (pass) {
                if(pass.isEmpty)
                return null;
                if (pass.length < 6) return 'Senha muito curta';
                return null;
              },
              autovalidate: false,
            )
          ],
        ));
  }
}
