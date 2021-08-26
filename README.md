# Food_Aggregator_Project - Foodi

Here's the description of the project,

Foodi is basically a food aggregator, build on top of Blockchain technology using decentralisation and token based system. (ERC20). 

Users : There are mainly 3 users in the system. All users must stake some tokens in the system to perform any kind of transaction. ( To update Supply Chain )

   Hotel Management: Capable of Adding/ Removing and preparing item in Menu card.

   Delivery Executive: Capable to pickup and deliver the order to customer.

   Customer: Capable to order and view menu card.

Registration flow: User Registration ---> Staking ( Buy tokens) ----> Mainflow

Mainflow: Customer -->(Selects an item from menu and add to cart and checkout)--> Hotel Management-->(Prepares the food )-->Executive-->(Picks and delivers order)-->Customer( Confirms the Delivery of Order)


Functionalities:

Token Contract :

     It is the basic Contract in which the minting of tokens takes place.


Customer Contract:

    It is the user contract where the user can be added to the Network Register_as_Customer(); or Existing user can use the network.

Hotel Contract:

    It is the Hotel contract where there can New Hotels can be Added Register_as_ Hotel(); or Existing hotel be a part of the Network.


Delivery Executive Contract:

    It is the Executive contract where there can New Hotels can be Added Register_as_ Executive(); or Existing Executive be a part of the Network.

 
Main Contract:

    It is the main part as well as ICO Contract, where every action is taken by the every individual and performs the task accordingly. Where the Customers Can Select the List of Items SelectItem(); and Add to their cart AddToCart(); and pay for the Item Pay();  etc… and Hotel can Prepare the order and Executive can pickup and deliver the Order.

 
Output:

The Customer Order an Item and checkout, The Hotel will Prepare the Order (Bill amount will be staked by hotel Management) and confirms the Order. Delivery Executive Picks( Bill amount will be staked) and delivers the Order and confirms the order, Once the Order is delivered to the Customer, The customer confirms the delivery. Then staked Tokens will be send to Delivery executive along with rewards.

