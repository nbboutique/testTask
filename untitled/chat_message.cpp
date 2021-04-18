#include "chat_message.hpp"

#include <iostream>
// debug
#include <string>

chat_message::chat_message() : body_length_(0) {}

const char* chat_message::data() const {
    return data_;
}

char* chat_message::data() {
    return data_;
}

std::size_t chat_message::length() const {
    return header_length + body_length_;
}

const char* chat_message::body() const {
    return data_ + header_length;
}

char* chat_message::body() {
    return data_ + header_length;
}

std::size_t chat_message::body_length() const {
    return body_length_;
}

void chat_message::body_length(std::size_t new_length) {
    body_length_ = new_length;
    if (body_length_ > max_body_length)
        body_length_ = max_body_length;
}

bool chat_message::decode_header() {
    char header[header_length + 1] = "";
    std::strncat(header, data_, header_length);
    body_length_ = std::atoi(header);
    if (body_length_ > max_body_length) {
        body_length_ = 0;
        return false;
    }
    return true;
}

void chat_message::encode_header() {
    char header[header_length + 1] = "";
    std::sprintf(header, "%4d", static_cast<int>(body_length_));

//    {
//        std::string str_header(header);
//        const int int_header = std::stoi(str_header);
//        std::cout << "DEBUG: header = " << int_header << '\n';
//    }

    std::memcpy(data_, header, header_length);

//   const std::string str_body(data_);
//    std::cout << "DEBUG data:" << str_body << '\n';
}
