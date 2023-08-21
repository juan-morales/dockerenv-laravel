<?php

namespace App\Http\Controllers;

use App\Models\Snomed;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class SnowstormController extends Controller
{
    public function getConceptos(Request $request, $rama, $concepto){
        try {
            $response = Http::withHeaders([
                'Accept-Language' => 'es',
            ])->get("http://snowtest.cepsi.gob.ar" . '/'. $rama .'/'. $concepto, $request->all());

            $datos = $response->json();
            return response()->json($datos);
        }catch (\Exception $exception){
            return response()->json('Error en procesamiento',500);
        }
    }
}
