<?php
namespace App\Controller;

use App\Controller\AppController;


// https://onlinetools.ups.com/webservices/FreightRate
// daniel.ching
// renesola.123
// 2CEB0C5744F1E2DB
class FreightRateController extends AppController
{

    private function processFreightRate($request)
    {
        //create soap request
        $option['RequestOption'] = $this->request->query['service_name'];//'RateChecking Option';
        $request['Request'] = $option;
        $shipfrom['Name'] = '';
        $addressFrom['AddressLine'] = '';
        $addressFrom['City'] = '';
        $addressFrom['StateProvinceCode'] = '';
        //$addressFrom['PostalCode'] = '90501';
        $addressFrom['PostalCode'] = $this->request->query['from_addr_postal_code'];
        $addressFrom['CountryCode'] = 'US';
        $shipfrom['Address'] = $addressFrom;
        $request['ShipFrom'] = $shipfrom;

        $shipto['Name'] = '';
        $addressTo['AddressLine'] = '';
        $addressTo['City'] = '';
        $addressTo['StateProvinceCode'] = '';
        //$addressTo['PostalCode'] = '94544';
        $addressTo['PostalCode'] = $this->request->query['to_addr_postal_code'];
        $addressTo['CountryCode'] = 'US';
        $shipto['Address'] = $addressTo;
        $request['ShipTo'] = $shipto;

        /*
        $payer['Name'] = 'Payer inc';
        $addressPayer['AddressLine'] = '435 SOUTH STREET';
        $addressPayer['City'] = 'RIS TOWNSHIP';
        $addressPayer['StateProvinceCode'] = 'NJ';
        $addressPayer['PostalCode'] = '94105'; */
        $payer['Name'] = $this->request->query['payer_name'];
        $addressPayer['AddressLine'] = $this->request->query['payer_address1'];
        $addressPayer['City'] = $this->request->query['payer_city'];
        $addressPayer['StateProvinceCode'] = $this->request->query['payer_state'];
        $addressPayer['PostalCode'] =$this->request->query['payer_postal_code'];
        $addressPayer['CountryCode'] = 'US';
        $payer['Address'] = $addressPayer;
        $shipmentbillingoption['Code'] = '30'; // change
        $shipmentbillingoption['Description'] = 'Third Party';
        $paymentinformation['Payer'] = $payer;
        $paymentinformation['ShipmentBillingOption'] = $shipmentbillingoption;
        $request['PaymentInformation'] = $paymentinformation;

        $service['Code'] = '308';
        $service['Description'] = 'UPS Freight LTL';
        $request['Service'] = $service;

        //$handlingunitone['Quantity'] = '1';
        $handlingunitone['Quantity'] = $this->request->query['quantity'];
        $handlingunitone['Type'] = array
        (
            'Code' => 'PLT',
            'Description' => 'PALLET'
        );
        $request['HandlingUnitOne'] = $handlingunitone;

        $commodity['CommodityID'] = '';
        $commodity['Description'] = 'No Description';
        $commodity['Weight'] = array
        (
            'UnitOfMeasurement' => array
            (
                'Code' => 'LBS',
                'Description' => 'Pounds'
            ),
            //'Value' => '1570'
            'Value' => $this->request->query['weight']
        );
        $commodity['Dimensions'] = array
        (
            'UnitOfMeasurement' => array
            (
                'Code' => 'IN',
                'Description' => 'Inches'
            ),
            /*
            'Length' => '80',
            'Width' => '48',
            'Height' => '44' */
            'Length' => $this->request->query['dim_length'],
            'Width' => $this->request->query['dim_width'],
            'Height' => $this->request->query['dim_height']
        );
        //$commodity['NumberOfPieces'] = '25';
        $commodity['NumberOfPieces'] = $this->request->query['number_of_pieces'];
        $commodity['PackagingType'] = array
        (
            'Code' => 'Carton',
            'Description' => 'Carton'
        );

        //$commodity['FreightClass'] = '85';
        $commodity['FreightClass'] = $this->request->query['freight_class'];
        $commodity['NMFCCommodityCode'] = '';
        $request['Commodity'] = $commodity;

        //echo "Request.......\n";
        //print_r($request);
        //echo "\n\n";
        return $request;
    }
    public function index()
    {

        $this->autoRender = false;

        if ($this->request->is('post')) {
            //Configuration
            $debug = TRUE;
            $access = $this->request->query['access'];
            $wsdl = "SCHEMA-WSDLs/FreightRate.wsdl";
            $operation = "ProcessFreightRate";
            $outputFileName = "/tmp/XOLTResult.xml";


            $endpointurl = $this->request->query['endpointurl'];


            try {

                $mode = array
                (
                    'soap_version' => 'SOAP_1_1',  // use soap 1.1 client
                    'trace' => 1
                );

                // initialize soap client
                $client = new \SoapClient($wsdl, $mode);

                //set endpoint url
                $client->__setLocation($endpointurl);


                //create soap header
                $usernameToken['Username'] = $this->request->query['userid'];
                $usernameToken['Password'] = $this->request->query['passwd'];


                $serviceAccessLicense['AccessLicenseNumber'] = $access;
                $upss['UsernameToken'] = $usernameToken;
                $upss['ServiceAccessToken'] = $serviceAccessLicense;

                $header = new \SoapHeader('http://www.ups.com/XMLSchema/XOLTWS/UPSS/v1.0', 'UPSSecurity', $upss);
                $client->__setSoapHeaders($header);


                //get response
                $resp = $client->__soapCall($operation, array($this->processFreightRate($this->request)));

                //get status
                //echo "Response Status: " . $resp->Response->ResponseStatus->Description ."\n";

                //save soap request and response to file
                //echo 'Writing into '.$outputFileName;
                /*
                REMOVE FILE WRITE AFTER DEBUGGING FIXME
                */
                if  ($debug){

                }

                $fw = fopen($outputFileName, 'w');
                fwrite($fw, "Request: \n" . $client->__getLastRequest() . "\n");
                fwrite($fw, "Response: \n" . $client->__getLastResponse() . "\n");
                fclose($fw);
                echo $client->__getLastResponse();
            } catch (Exception $ex) {
                print_r($ex);

                //save soap request and response to file
                echo 'Writing into ' . $outputFileName;
                $fw = fopen($outputFileName, 'w');
                fwrite($fw, "Request: \n" . $client->__getLastRequest() . "\n");
                fwrite($fw, "Response: \n" . $client->__getLastResponse() . "\n");
                fclose($fw);
            }
        } else {

            echo 'get lost';
        }
    }
}
