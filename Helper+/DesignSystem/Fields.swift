//
//  Fields.swift
//  Helper+
//
//  Created by Felipe Assis on 17/4/2025.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: String
    let prefixIcon: String?
    let suffixIcon: String?
    let keyboardType: UIKeyboardType
    let disableAutocorrection: Bool?
    let onChange: ((String, String) -> Void)?
    @FocusState private var isTextFieldFocused: Bool
    
    init(
        text: Binding<String>,
        placeholder: String,
        prefixIcon: String? = nil,
        suffixIcon: String? = nil,
        keyboardType: UIKeyboardType = .default,
        disableAutocorrection: Bool? = false,
        onChange: ((String, String) -> Void)? = nil
    ) {
        self.placeholder = placeholder
        self._text = text
        self.keyboardType = keyboardType
        self.disableAutocorrection = disableAutocorrection
        self.onChange = onChange
        self.prefixIcon = prefixIcon
        self.suffixIcon = suffixIcon
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                if let prefix = prefixIcon {
                    Image(prefix)
                        .renderingMode(.template)
                        .font(Fonts.bodySmallBold)
                        .foregroundColor(
                            isTextFieldFocused ? Colors.bgAccent : Colors.border
                        )
                }
                TextField(placeholder, text: $text)
                    .font(Fonts.bodyMediumRegular)
                    .foregroundColor(Colors.bgInverse)
                    .keyboardType(keyboardType)
                    .disableAutocorrection(disableAutocorrection)
                    .focused($isTextFieldFocused)
                    .onChange(of: text) { oldValue, newValue in
                        onChange?(oldValue, newValue)
                    }
                
                if let suffix = suffixIcon {
                    Image(suffix)
                        .renderingMode(.template)
                        .font(Fonts.bodySmallBold)
                        .foregroundColor(
                            isTextFieldFocused ? Colors.bgAccent : Colors.border
                        )
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 12)
            .cornerRadius(10)
            .frame(height: 44)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isTextFieldFocused ? Colors.bgAccent : Colors.border,
                            lineWidth: 1))
            
        }.frame(height: 44)
    }
}

struct CustomSecureField: View {
    @Binding var text: String
    let placeholder: String
    let prefixIcon: String?
    let keyboardType: UIKeyboardType
    let disableAutocorrection: Bool?
    let onChange: ((String, String) -> Void)?
    @FocusState private var isTextFieldFocused: Bool
    @State private var isPasswordVisible: Bool = false
    
    init(
        text: Binding<String>,
        placeholder: String,
        prefixIcon: String? = nil,
        keyboardType: UIKeyboardType = .default,
        disableAutocorrection: Bool? = false,
        onChange: ((String, String) -> Void)? = nil
    ) {
        self.placeholder = placeholder
        self._text = text
        self.keyboardType = keyboardType
        self.disableAutocorrection = disableAutocorrection
        self.onChange = onChange
        self.prefixIcon = prefixIcon
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                if let prefix = prefixIcon {
                    Image(prefix)
                        .renderingMode(.template)
                        .font(Fonts.bodySmallBold)
                        .foregroundColor(
                            isTextFieldFocused ? Colors.bgAccent : Colors.border
                        )
                }
                
                if isPasswordVisible {
                    TextField(placeholder, text: $text)
                        .font(Fonts.bodyMediumRegular)
                        .foregroundColor(Colors.bgInverse)
                        .keyboardType(keyboardType)
                        .disableAutocorrection(disableAutocorrection)
                        .focused($isTextFieldFocused)
                        .onChange(of: text) { oldValue, newValue in
                            onChange?(oldValue, newValue)}
                } else {
                    SecureField(placeholder, text: $text)
                        .font(Fonts.bodyMediumRegular)
                        .foregroundColor(Colors.bgInverse)
                        .keyboardType(keyboardType)
                        .disableAutocorrection(disableAutocorrection)
                        .focused($isTextFieldFocused)
                        .onChange(of: text) { oldValue, newValue in
                            onChange?(oldValue, newValue)
                        }
                }
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(isPasswordVisible ? Assets.iconVisibility : Assets.iconVisibilityOff)
                        .renderingMode(.template)
                        .font(Fonts.bodySmallBold)
                        .foregroundColor(Colors.border)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 12)
            .cornerRadius(10)
            .frame(height: 44)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isTextFieldFocused ? Colors.bgAccent : Colors.border,
                            lineWidth: 1))
        }
        .frame(height: 44)        
    }
}
