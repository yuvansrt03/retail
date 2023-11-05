from rest_framework.response import Response
from django.shortcuts import render
from rest_framework.decorators import api_view
from .models import Product,Transactions
from .serializers import ProductSerializer,TransactionsSerializer,ShopSerializer
import requests
import pickle
@api_view(['GET'])
def getProducts(request):
    data=Product.objects.all()
    serializer=ProductSerializer(data,many=True)
    return Response(serializer.data)

# @api_view(['POST'])
# def addProduct(request):
#     serializers=ProductSerializer
# Function to simulate user interactions and get recommendations

# @api_view(['GET'])
# def getRecommendation(request,id):
#     model=pickle.load(open("shopAPI\MLModels\userInterationBasedRecommendation.pkl","rb"))
#     data=Transactions.objects.filter(customerId=id)
#     serializer=TransactionsSerializer(data,many=True)
#     past_transactions=[]
#     for x in serializer.data:
#         transaction_binary=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
#         x_products=x['products']
#         for i in x_products:
#             transaction_binary[int(i['id'])-1]=1
#         past_transactions.append(transaction_binary)
    
#     return Response(serializer.data)
    