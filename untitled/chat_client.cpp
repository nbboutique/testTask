#include <cstdlib>
#include <deque>
#include <iostream>
#include <thread>
#include <boost/asio.hpp>
#include "chat_message.hpp"

using boost::asio::ip::tcp;

typedef std::deque<chat_message> chat_message_queue;

class chat_client
{
  public:
    chat_client(boost::asio::io_service& io_service,
                tcp::resolver::iterator endpoint_iterator)
        : io_service_(io_service),
          socket_(io_service)
    {
        do_connect(endpoint_iterator);
    }

    void write(const chat_message& msg)
    {
        io_service_.post(
            [this, msg]()
            {
                bool write_in_progress = !write_msgs_.empty();
                write_msgs_.push_back(msg);
                if (!write_in_progress)
                {
                    do_write();

                }
            });
    }

    void close()
    {
        io_service_.post([this]() { socket_.close(); });
    }

  private:
    void do_connect(tcp::resolver::iterator endpoint_iterator)
    {
        boost::asio::async_connect(socket_, endpoint_iterator,
                                   [this](boost::system::error_code ec, tcp::resolver::iterator)
                                   {
                                       if (!ec)
                                       {
                                           do_read_header();
                                       }
                                   });
    }

    void do_read_header()
    {
        boost::asio::async_read(socket_,
                                boost::asio::buffer(read_msg_.data(), chat_message::header_length),
                                [this](boost::system::error_code ec, std::size_t /*length*/)
                                {
                                    if (!ec && read_msg_.decode_header())
                                    {
                                        do_read_body();
                                    }
                                    else
                                    {
                                        socket_.close();
                                    }
                                });
    }

    void do_read_body()
    {
        boost::asio::async_read(socket_,
                                boost::asio::buffer(read_msg_.body(), read_msg_.body_length()),
                                [this](boost::system::error_code ec, std::size_t /*length*/)
                                {
                                    if (!ec)
                                    {
                                        std::cout.write(read_msg_.body(), read_msg_.body_length());
                                        std::cout << "\n";
                                        do_read_header();
                                    }
                                    else
                                    {
                                        socket_.close();
                                    }
                                });
    }

    void do_write()
    {
        boost::asio::async_write(socket_,
                                 boost::asio::buffer(write_msgs_.front().data(),
                                                     write_msgs_.front().length()),
                                 [this](boost::system::error_code ec, std::size_t /*length*/)
                                 {
                                     if (!ec)
                                     {
                                         write_msgs_.pop_front();
                                         if (!write_msgs_.empty())
                                         {
                                             do_write();
                                         }
                                     }
                                     else
                                     {
                                         socket_.close();
                                     }
                                 });
    }

  private:
    boost::asio::io_service& io_service_;
    tcp::socket socket_;
    chat_message read_msg_;
    chat_message_queue write_msgs_;
};

void HelpForClient() {
    std::cout << "Commands available:\n" << std::endl;
    std::cout << "-" << "help - \n \tThis help message\n"
              << "-" << "exit - \n \tQuit the session\n"
              << "-" << "connect  - \n\tConnect to the server\n"
              << "-" << "send  - \n\tSend message to the server\n"
            ;
}

int main()
{
    std::string choose;
    std::string host_ ;
    std::string port_;
    boost::asio::io_service io_service;
    std::cout<<"Enter port for localhost 127.0.0.1 : ";
    std::cin>>port_;
    tcp::resolver resolver(io_service);
    tcp::resolver::query query("127.0.0.1", port_);
    tcp::resolver::iterator iter = resolver.resolve( query);
    tcp::endpoint ep = *iter;
    chat_client c(io_service, iter);
    std::thread t([&io_service](){ io_service.run(); });

    while (true) {
        std::cout << "client->";
        std::cin >> choose;
        if (choose == "help") {
            HelpForClient();
        }
        else if (choose == "exit") {
            break;
        }
        else if (choose == "connect") {
            std::cout<<"\n"<<"to 127.0.0.1 : "<<port_;
            std::cout<<"\n"<<"Connecting to 127.0.0.1 : "<<port_;
            std::cout<<"\n"<<"Connected! "<<"\n";
        }
        else if (choose == "send"){
                char line[chat_message::max_body_length + 1];
                while (std::cin.getline(line, chat_message::max_body_length + 1))
                {
                    chat_message msg;
                    msg.body_length(std::strlen(line));
                    std::memcpy(msg.body(), line, msg.body_length());
                    msg.encode_header();
                    c.write(msg);
                    std::cout<<"Message sent to  "<< "127.0.0.1"<<":" << port_ << " with data: "<<line<<"\n";
                    break;
        }
            std::cout<<"client->"<<"\n";
        }else if (choose == "exit") {

            c.close();
        }

    }

    t.join();

        return 0;
    }

