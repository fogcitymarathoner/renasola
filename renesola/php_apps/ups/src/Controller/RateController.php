<?php
namespace App\Controller;

use App\Controller\AppController;
require('../vendor/gabrielbull/ups-api/src/Ups/Rate.php');
use Ups\Rate as Rate;

// https://onlinetools.ups.com/webservices/FreightRate
// daniel.ching
// renesola.123
// 2CEB0C5744F1E2DB
class RateController extends AppController
{


    public function index()
    {
        $this->autoRender = false;

        $accessKey = "7CEACE3E25A4C796";
        $userId = "Y2E259";
        $password = "F1amingred";

        if ($this->request->is('post')){

            $from_addr_postal_code = $this->request->query['from_addr_postal_code'];
            $to_addr_postal_code = $this->request->query['to_addr_postal_code'];

            $dim_length = $this->request->query['dim_length'];
            $dim_width = $this->request->query['dim_width'];
            $dim_height = $this->request->query['dim_height'];
            $weight = $this->request->query['weight'];



            $rate = new Rate(
                $accessKey,
                $userId,
                $password
            );

            try {
                $shipment = new \Ups\Entity\Shipment();

                $shipperAddress = $shipment->getShipper()->getAddress();
                $shipperAddress->setPostalCode($from_addr_postal_code);

                $from_address = new \Ups\Entity\Address();
                $from_address->setPostalCode($from_addr_postal_code);
                $shipFrom = new \Ups\Entity\ShipFrom();
                $shipFrom->setAddress($from_address);

                $shipment->setShipFrom($shipFrom);

                $shipTo = $shipment->getShipTo();
                $shipTo->setCompanyName('Test Ship To');
                $shipToAddress = $shipTo->getAddress();
                $shipToAddress->setPostalCode($to_addr_postal_code);

                $package = new \Ups\Entity\Package();
                $package->getPackagingType()->setCode(\Ups\Entity\PackagingType::PT_PACKAGE);
                $package->getPackageWeight()->setWeight($weight);

                $dimensions = new \Ups\Entity\Dimensions();
                $dimensions->setHeight($dim_height);
                $dimensions->setWidth($dim_width);
                $dimensions->setLength($dim_length);

                $unit = new \Ups\Entity\UnitOfMeasurement;
                $unit->setCode(\Ups\Entity\UnitOfMeasurement::UOM_IN);

                $dimensions->setUnitOfMeasurement($unit);
                $package->setDimensions($dimensions);

                $shipment->addPackage($package);

                echo json_encode($rate->getRate($shipment));
            } catch (Exception $e) {
                var_dump($e);
            }
        } else {
            echo 'get lost';

        }
    }
}